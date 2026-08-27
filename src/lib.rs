use cirru_edn::{Edn, EdnListView};
use std::mem;
use std::panic::{AssertUnwindSafe, catch_unwind};
use std::path::Path;
use std::ptr;
use std::slice;

const BUFFER_PROTOCOL_VERSION: u32 = 1;
const MAX_BUFFER_BYTES: usize = 256 * 1024 * 1024;

#[repr(C)]
pub struct CalcitFfiBuffer {
  ptr: *mut u8,
  len: usize,
  cap: usize,
}

#[unsafe(no_mangle)]
pub extern "C" fn calcit_ffi_buffer_version() -> u32 {
  BUFFER_PROTOCOL_VERSION
}

/// Release a response allocated by this module.
///
/// # Safety
///
/// `buffer` must be returned unchanged by this dylib and freed exactly once.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn calcit_ffi_buffer_free(buffer: CalcitFfiBuffer) {
  if !buffer.ptr.is_null() {
    // SAFETY: the buffer came from `write_buffer` in this dylib.
    drop(unsafe { Vec::from_raw_parts(buffer.ptr, buffer.len, buffer.cap) });
  }
}

fn write_buffer(output: *mut CalcitFfiBuffer, bytes: Vec<u8>) -> Result<(), String> {
  if output.is_null() {
    return Err("Calcit FFI output pointer is null".to_owned());
  }
  let mut bytes = bytes;
  let buffer = CalcitFfiBuffer {
    ptr: bytes.as_mut_ptr(),
    len: bytes.len(),
    cap: bytes.capacity(),
  };
  mem::forget(bytes);
  // SAFETY: the caller provided writable storage for one buffer.
  unsafe { ptr::write(output, buffer) };
  Ok(())
}

unsafe fn decode_request(request_ptr: *const u8, request_len: usize) -> Result<Vec<Edn>, String> {
  if request_len > MAX_BUFFER_BYTES {
    return Err(format!("Calcit FFI request exceeds {MAX_BUFFER_BYTES} bytes"));
  }
  if request_ptr.is_null() && request_len != 0 {
    return Err("Calcit FFI request pointer is null".to_owned());
  }
  let request = if request_len == 0 {
    &[]
  } else {
    // SAFETY: request bytes remain readable for this synchronous call.
    unsafe { slice::from_raw_parts(request_ptr, request_len) }
  };
  let source = std::str::from_utf8(request).map_err(|error| format!("Calcit FFI request is not UTF-8: {error}"))?;
  let data = cirru_edn::parse(source).map_err(|error| format!("Calcit FFI request is not Cirru EDN: {error}"))?;
  let Edn::List(EdnListView(args)) = data else {
    return Err(format!("Calcit FFI request must be an EDN list, got {}", data.type_name()));
  };
  Ok(args)
}

fn path_exists(args: Vec<Edn>) -> Result<Edn, String> {
  if args.len() == 1 {
    if let Edn::Str(name) = &args[0] {
      Ok(Edn::Bool(Path::new(&**name).exists()))
    } else {
      Err(format!("path-exists? expected 1 filename, got {:?}", args))
    }
  } else {
    Err(format!("path-exists? expected 1 arg, got {:?}", args))
  }
}

unsafe fn call_path_exists(request_ptr: *const u8, request_len: usize, output: *mut CalcitFfiBuffer) -> i32 {
  let result = catch_unwind(AssertUnwindSafe(|| {
    // SAFETY: forwarded from the exported synchronous contract.
    let args = unsafe { decode_request(request_ptr, request_len) }?;
    path_exists(args)
  }));
  let (status, bytes) = match result {
    Ok(Ok(value)) => match cirru_edn::format(&value, true) {
      Ok(source) => (0, source.into_bytes()),
      Err(error) => (2, format!("failed to encode Calcit FFI response: {error}").into_bytes()),
    },
    Ok(Err(error)) => (1, error.into_bytes()),
    Err(_) => (2, b"panic inside calcit_dylib".to_vec()),
  };
  if write_buffer(output, bytes).is_err() { 2 } else { status }
}

/// Check one path through C-safe buffer protocol v1.
///
/// # Safety
///
/// Request bytes must remain readable and `output` writable for this call.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn path_exists_calcit_ffi_v1(request_ptr: *const u8, request_len: usize, output: *mut CalcitFfiBuffer) -> i32 {
  // SAFETY: the adapter copies and validates every call-scoped input.
  unsafe { call_path_exists(request_ptr, request_len, output) }
}

#[cfg(test)]
mod tests {
  use super::*;

  fn call(args: Vec<Edn>) -> (i32, Edn) {
    let request = cirru_edn::format(&Edn::List(EdnListView(args)), true).expect("encode request");
    let mut output = CalcitFfiBuffer {
      ptr: ptr::null_mut(),
      len: 0,
      cap: 0,
    };
    let status = unsafe { path_exists_calcit_ffi_v1(request.as_ptr(), request.len(), &mut output) };
    let bytes = unsafe { slice::from_raw_parts(output.ptr, output.len) };
    let value = if status == 0 {
      cirru_edn::parse(std::str::from_utf8(bytes).expect("UTF-8 response")).expect("EDN response")
    } else {
      Edn::str(std::str::from_utf8(bytes).expect("UTF-8 error"))
    };
    unsafe { calcit_ffi_buffer_free(output) };
    (status, value)
  }

  #[test]
  fn buffer_protocol_round_trips_path_result() {
    assert_eq!(calcit_ffi_buffer_version(), 1);
    assert_eq!(call(vec![Edn::str("Cargo.toml")]), (0, Edn::Bool(true)));
    assert_eq!(call(vec![Edn::str("missing-file")]), (0, Edn::Bool(false)));
  }

  #[test]
  fn buffer_protocol_rejects_invalid_requests_without_panicking() {
    let (status, error) = call(vec![Edn::Number(1.0)]);
    assert_eq!(status, 1);
    assert!(error.read_str().expect("error string").contains("expected 1 filename"));

    let mut output = CalcitFfiBuffer {
      ptr: ptr::null_mut(),
      len: 0,
      cap: 0,
    };
    assert_eq!(unsafe { path_exists_calcit_ffi_v1(ptr::null(), 1, &mut output) }, 1);
    unsafe { calcit_ffi_buffer_free(output) };
  }
}
