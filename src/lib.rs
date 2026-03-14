use cirru_edn::Edn;
use std::path::Path;

#[unsafe(no_mangle)]
pub fn abi_version() -> String {
  String::from("0.0.9")
}

#[unsafe(no_mangle)]
pub fn edn_version() -> String {
  cirru_edn::version().to_string()
}

#[unsafe(no_mangle)]
pub fn path_exists(args: Vec<Edn>) -> Result<Edn, String> {
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
