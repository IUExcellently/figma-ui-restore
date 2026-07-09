# web-pc-admin · Web PC / 后台管理系统兼容规则

当目标平台为 PC Web、后台管理系统或管理端页面时，启用本平台 Profile。

当前 Web PC 后台规则仍由现有 `steering/01-07` 承载：

- `steering/01-scope-and-layout.md`
- `steering/02-engineering-charter.md`
- `steering/03-component-and-events.md`
- `steering/04-spacing-and-layout.md`
- `steering/05-responsive-rules.md`
- `steering/06-forms-and-tables.md`
- `steering/07-visual-qa.md`

## Web PC 专属假设

以下规则只对 `web-pc-admin` 生效，不得污染小程序或 H5：

- Sidebar / Header / Menu / Layout 边界判断
- 已有 Layout 时只生成 content 区域
- 表格区域优先复用项目全局 Table
- Arco / Element / Ant Design 等 PC 组件库优先
- `1440 / 1024 / 768 / 520 / 375` 响应式覆盖
- chrome-devtools MCP 浏览器截图验收
