# Calcit 0.13.64 and native FFI 0.1.3 / 升级记录

## 中文

- 将模板的 Calcit 版本从 0.13.57 升级到 0.13.64。
- 将共享 `calcit_native_ffi` crate 从 0.1.2 升级到 0.1.3，继续复用统一的 C-safe descriptor、buffer ownership、Cirru EDN transport 与 export macro。
- 使用 0.13.64 formatter 将 `calcit.cirru` 的 namespace/definition key 规范化为 symbol；loader 仍兼容旧 string key。
- 通过仓库既有的 Rust、Caps、Calcit quality/dynamic-methods 和真实 dylib smoke 验证升级。

## English

- Upgrade the template from Calcit 0.13.57 to 0.13.64.
- Upgrade the shared `calcit_native_ffi` crate from 0.1.2 to 0.1.3, continuing to reuse the canonical C-safe descriptor, buffer ownership, Cirru EDN transport, and export macro.
- Canonicalize namespace/definition keys in `calcit.cirru` to symbols with the 0.13.64 formatter; the loader remains compatible with legacy string keys.
- Verify the upgrade through the repository's Rust, Caps, Calcit quality/dynamic-methods, and real dylib smoke gates.
