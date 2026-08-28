use cirru_edn::Edn;
use std::path::Path;

use calcit_native_ffi::{CalcitFfiBuffer, run_buffer_adapter};

calcit_native_ffi::export_buffer_abi_v1!();

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
  // SAFETY: the shared adapter copies and validates request bytes and owns the
  // response buffer contract for this synchronous call.
  unsafe { run_buffer_adapter(request_ptr, request_len, output, path_exists) }
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
  use calcit_native_ffi::copy_buffer;
  use cirru_edn::EdnListView;
  use std::ptr;

  fn call(args: Vec<Edn>) -> (i32, Edn) {
    let request = cirru_edn::format(&Edn::List(EdnListView(args)), true).expect("encode request");
    let mut output = CalcitFfiBuffer::empty();
    let status = unsafe { path_exists_calcit_ffi_v1(request.as_ptr(), request.len(), &mut output) };
    let bytes = unsafe { copy_buffer(output) }.expect("valid output buffer");
    let value = if status == 0 {
      cirru_edn::parse(std::str::from_utf8(&bytes).expect("UTF-8 response")).expect("EDN response")
    } else {
      Edn::str(std::str::from_utf8(&bytes).expect("UTF-8 error"))
    };
    unsafe { calcit_ffi_buffer_free(output) };
    (status, value)
  }

  #[test]
  fn buffer_protocol_round_trips_path_result() {
    assert_eq!(calcit_ffi_buffer_version(), calcit_native_ffi::BUFFER_PROTOCOL_VERSION);
    assert_eq!(call(vec![Edn::str("Cargo.toml")]), (0, Edn::Bool(true)));
    assert_eq!(call(vec![Edn::str("missing-file")]), (0, Edn::Bool(false)));
  }

  #[test]
  fn buffer_protocol_rejects_invalid_requests_without_panicking() {
    let (status, error) = call(vec![Edn::Number(1.0)]);
    assert_eq!(status, 1);
    assert!(error.read_str().expect("error string").contains("expected 1 filename"));

    let mut output = CalcitFfiBuffer::empty();
    assert_eq!(unsafe { path_exists_calcit_ffi_v1(ptr::null(), 1, &mut output) }, 1);
    unsafe { calcit_ffi_buffer_free(output) };
  }
}
