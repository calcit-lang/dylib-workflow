## Workflow

> Rust libray for Calcit runtime.

### Usages

Install to `~/.config/calcit/modules/`, compile and provide `*.dylib` file:

```bash
cargo build --release
mkdir dylibs/ && cp -v target/release/*.dylib dylibs/ # supported macos only
```

Providing:

```cirru
lib.core/path-exists? a
```

### Workflow

https://github.com/calcit-lang/dylib-workflow

### License

MIT
