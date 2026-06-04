# AGENTS.md

本仓库包含 `figma-ui-restore` 工作流。

当用户要求根据 Figma MCP 数据、设计截图、meta.json、reference.tsx 或手工规格还原后台管理系统页面时，优先使用根目录 `SKILL.md` 与 `steering/` 中的规则。

关键约束：

- 先确认页面类型和 Layout 边界，再写代码。
- 已有 Layout 时只生成 content 区域。
- 不在组件内写 font-family。
- 变量先查已有，缺失再新增。
- 组件之间外部间距由父级控制。
- 组件内部 gap 不能无脑使用。
- 页面处理路由、接口、权限；组件通过语义化事件 emit。
- 表格区域优先复用项目全局 Table。
- 响应式覆盖 1440 / 1024 / 768 / 520 / 375。
- chrome-devtools MCP 可用时必须截图验收，不可用时说明降级。
