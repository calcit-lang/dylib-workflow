# Agent notes

This repository provides a native Calcit dynamic-library workflow. Keep project notes short and use maintained CLI documentation.

```bash
calcit docs agents --full
calcit docs read upgrade --full
caps --ci
calcit calcit.cirru edit format
calcit calcit.cirru --check-only
```

The canonical snapshot is `calcit.cirru`; do not use or add `compact.cirru`. Use `calcit`, not the retired `cr` command. Build the native library with the repository's `build.sh` after the Calcit check passes.

The C-safe descriptor, buffer ownership, Cirru EDN transport, and adapter are
owned by `calcit_native_ffi`; examples should not copy those protocol templates.

C-safe descriptor、buffer ownership、Cirru EDN transport 与 adapter 由
`calcit_native_ffi` 统一维护；示例中不要复制这些协议模板。
