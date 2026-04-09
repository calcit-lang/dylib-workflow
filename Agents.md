## dylib-workflow 开发说明

### 关键步骤

1. **升级依赖版本**
   - 在 `Cargo.toml` 中保持与当前 Calcit 运行时兼容：
     - `cirru_edn = "0.7.3"`
     - `cirru_parser = "0.2.3"`
   - 当前工程使用 `edition = "2024"`。

2. **保持 FFI 导出接口完整**
   - 所有导出函数使用 `#[unsafe(no_mangle)]`。
   - 至少导出以下函数：
     - `abi_version() -> String`
     - `edn_version() -> String`
   - `edn_version()` 需要返回：
     - `cirru_edn::version().to_string()`

3. **业务函数签名**
   - Calcit 侧通过 `&call-dylib-edn` 调用 Rust 导出函数。
   - Rust 侧函数保持形如：
     - `pub fn path_exists(args: Vec<Edn>) -> Result<Edn, String>`
   - 参数数量和类型检查在 Rust 内部显式处理，错误信息直接返回字符串。

4. **构建动态库**
   - 在项目根目录执行：
     - `cargo build --release`
   - 产物位于 `target/release/`。

5. **刷新运行时 dylib 文件**
   - 清理并复制产物到 `dylibs/`：
     - `rm -rf dylibs/*`
     - `mkdir -p dylibs`
     - `cp target/release/*.* dylibs/`
   - Calcit 示例默认从 `dylibs/libcalcit_std` 加载动态库。

6. **运行 Calcit 示例验证**
   - 执行：
     - `cr compact.cirru`
   - 当前预期输出应包含：
     - `%%%% test for lib`
     - `true false`
     - 最后返回 `nil`

### 修改时的检查清单

- 修改导出函数后，先确认 Rust 侧可以成功编译。
- 如果运行 `cr compact.cirru` 报 `dlsym failed`：
  - 先检查是否漏导出了 `edn_version`
  - 再检查 `#[unsafe(no_mangle)]` 是否遗漏
  - 再确认 `dylibs/` 中已复制最新产物
- 如果只更新了 `target/release/` 但没有同步到 `dylibs/`，Calcit 仍会加载旧库。

### 推荐验证流程

按顺序执行：

1. 修改 `Cargo.toml` / `src/lib.rs`
2. `cargo build --release`
3. 复制 `target/release/*.*` 到 `dylibs/`
4. `cr compact.cirru`

### 当前已验证状态

- 依赖版本已升级到 `cirru_edn 0.7.3`、`cirru_parser 0.2.3`
- FFI 已补充 `edn_version()`
- Rust 2024 下导出属性已切换为 `#[unsafe(no_mangle)]`
- `cr compact.cirru` 已验证通过
