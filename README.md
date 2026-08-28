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

The shared descriptor, buffer ownership, Cirru EDN transport, and adapter come
from [`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi).
The template keeps only its native business logic and exported method symbol.

共享 descriptor、buffer ownership、Cirru EDN transport 与 adapter 由
[`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi) 维护；
模板本身只保留 native 业务逻辑和对外方法 symbol。

The Calcit wrapper is fully typed and uses `Unit`/`&unit` for procedure
results. CI rejects new dynamic, nil, deprecated-API, unsafe-coerce, or dynamic
method-dispatch debt.

Calcit wrapper 已完整标注类型，过程返回值使用 `Unit`/`&unit`；CI 会拒绝新增
dynamic、nil、deprecated API、unsafe-coerce 或动态方法分派债务。

### Workflow

https://github.com/calcit-lang/dylib-workflow

### License

MIT
