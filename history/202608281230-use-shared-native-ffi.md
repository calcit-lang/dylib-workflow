# 使用共享 native FFI crate / Adopt the shared native FFI crate

## 中文

- 使用 `calcit_native_ffi 0.1.0` 统一 buffer v1 descriptor、ownership、Cirru EDN transport 和 adapter。
- 删除模板内重复的协议实现，保持 `path_exists_calcit_ffi_v1` 公开 symbol 与行为不变。
- 将依赖安装检查收紧为 `caps --strict --ci`，避免模板带出未解析的模块依赖。
- 为全部 Calcit 定义补齐静态 schema，过程显式返回 `&unit`，并增加 quality 与动态分派零容忍 CI。

## English

- Use `calcit_native_ffi 0.1.0` for the buffer-v1 descriptor, ownership, Cirru EDN transport, and adapter.
- Remove duplicated protocol code while preserving the public `path_exists_calcit_ffi_v1` symbol and behavior.
- Tighten dependency installation to `caps --strict --ci` so the template cannot carry unresolved module dependencies.
- Fully type every Calcit definition, return `&unit` explicitly from procedures, and add zero-tolerance quality and dynamic-dispatch CI gates.
