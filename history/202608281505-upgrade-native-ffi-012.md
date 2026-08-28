# 升级共享 native FFI 0.1.2 / Upgrade shared native FFI 0.1.2

## 中文

- 模板依赖升级至 `calcit_native_ffi 0.1.2`，避免新模块继续生成旧依赖。
- 使用共享的 raw ABI symbol、descriptor 与 function pointer contract；buffer 协议仍为 v1。
- 不改变模板的业务 API、buffer ownership 或 Calcit 0.13.57 最低版本。

## English

- Upgrade the template to `calcit_native_ffi 0.1.2` so new modules no longer start from an older dependency.
- Track the shared raw ABI symbols, descriptors, and function-pointer contracts while retaining buffer protocol v1.
- Keep the template business API, buffer ownership, and Calcit 0.13.57 minimum unchanged.
