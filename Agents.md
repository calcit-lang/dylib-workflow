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

This is a template repository, not a released module. Keep `deps.cirru
:version` as metadata and do not bump it, create version tags, or publish
GitHub releases after maintenance merges. Update dependencies and validation
on `main`; users consume the current template by copying or forking it.

这是模板仓库，不是发布型模块。`deps.cirru :version` 仅作为元数据；维护改动合并后
不要递增版本、创建版本 tag 或发布 GitHub Release。依赖与验证随 `main` 更新，
用户通过复制或 fork 当前模板使用。
