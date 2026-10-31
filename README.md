## Workflow

> C-safe native library example for the Calcit runtime.

使用者影响：模板配对正式 Calcit **0.32.1**；复制模板后应同步
CLI 并用原锁文件重新构建本机 dylib。主线已采用当前类型表示，官方 format 无需再次改写 Snapshot；
不改变 Rust 源码、Cargo/lock、共享 FFI 依赖或 C-safe ABI。
新类型语法要求配套 CLI，既有零债务门禁与原测试保留。
本仓库不因此递增模板/Cargo 版本，也不创建 tag 或 GitHub Release。

API 设计: https://github.com/calcit-lang/calcit_runner.rs/discussions/116 .

### Usages

APIs:

```cirru
lib.core/path-exists? |Cargo.toml
```

Copy or fork the template into your project, run `caps --strict --ci`, then build
the platform `*.{dylib,so}` with `./build.sh` and run `calcit calcit.cirru` there.
The dynamic artifact is a `cdylib` and exports only Calcit buffer protocol v1;
it does not expose Rust-layout `Vec<Edn>` entry points.

The shared descriptor, buffer ownership, Cirru EDN transport, and adapter come
from [`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi).
The template uses its synchronous EDN export macro and keeps only native
business logic plus the explicit method symbol. It tracks
`calcit_native_ffi 0.1.3`, whose shared raw ABI contracts stay on protocol v1.

共享 descriptor、buffer ownership、Cirru EDN transport 与 adapter 由
[`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi) 维护；
模板使用共享的同步 EDN export macro，只保留 native 业务逻辑和显式方法 symbol。
模板当前使用 `calcit_native_ffi 0.1.3`；共享 raw ABI contract 仍保持 protocol v1。

This repository is a workflow template rather than a versioned Calcit module.
Its `deps.cirru :version` is project metadata only: maintenance changes are
merged into `main` without incrementing that value, creating version tags, or
publishing GitHub releases. Consumers should copy or fork the current `main`.

本仓库是 workflow 模板，不是需要独立版本发布的 Calcit 模块。
`deps.cirru :version` 仅作为项目元数据；维护改动合并到 `main` 即可，不递增该值、
不创建版本 tag，也不发布 GitHub Release。使用方应复制或 fork 当前 `main`。

The Calcit wrapper is fully typed and uses `Unit`/`&unit` for procedure
results. CI rejects new dynamic, nil, deprecated-API, unsafe-coerce, or dynamic
method-dispatch debt.

Calcit wrapper 已完整标注类型，过程返回值使用 `Unit`/`&unit`；CI 会拒绝新增
dynamic、nil、deprecated API、unsafe-coerce 或动态方法分派债务。

模板本轮使用正式 Calcit 0.32.1 和 Caps 0.1.1，入口明确为 native；没有前端资源，
不增加 COS/CDN 配置或 JavaScript 构建。CI 保留严格检查、全部公开定义与原零债务
质量门禁、两项 Rust buffer ABI 测试、Clippy、release 导出核对和实际 native 入口。
不新增迁移规则或检查脚本，原 CI、测试和门禁完全保持。
维护改动不递增模板/Cargo 版本，也不更改原 ABI 或共享 FFI 依赖。
保留零债务要求，沿用单个 `--all-defs`
覆盖所有定义。原入口与 native 动态库回归需要实际执行，
不能用编译或静态检查替代。

`build.sh` 使用已提交 lock 构建，只复制当前平台的 `libcalcit_std.dylib` 或
`libcalcit_std.so`；不再递归清空 `dylibs/`，也不复制其他扩展名文件。
目标目录、库名、Darwin install name 和 C-safe protocol v1 保持不变，CI 复用同一构建脚本。

本模板没有 npm runtime 依赖；正式 CLI、Caps strict/toolchain、全部定义和零债务门禁、
原 Rust 测试、导出与实际动态库入口以本轮干净 Linux CI 为准。
本轮验证不代替所有平台或复制模板后的项目自身验收。

Action 引用沿用现有 tag/工具链通道（包括 Rust `stable`），可被移动，不等同不可变提交；只读权限和不保留
checkout 凭证仅限制暴露范围，不能消除这项供应链风险。

### Workflow

https://github.com/calcit-lang/dylib-workflow

### License

MIT
