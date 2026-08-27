## Workflow

> C-safe native library example for the Calcit runtime.

API 设计: https://github.com/calcit-lang/calcit_runner.rs/discussions/116 .

### Usages

APIs:

```cirru
lib.core/path-exists? a
```

Install to `~/.config/calcit/modules/`, compile and provide the `*.{dylib,so}` file with `./build.sh`.
The dynamic artifact is a `cdylib` and exports only Calcit buffer protocol v1;
it does not expose Rust-layout `Vec<Edn>` entry points.

### Workflow

https://github.com/calcit-lang/dylib-workflow

### License

MIT
