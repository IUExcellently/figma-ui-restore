# figma-ui-restore · Web PC 后台兼容规则

当用户明确要求根据 Figma MCP 数据、截图或节点信息还原后台管理系统 / Web PC 管理端页面时，应用本规则。

如果用户目标是小程序或 H5，请改用 `.qoder/rules/figma-ui-restore.md` 中的平台路由规则。

## 必须遵守

- 先判断目标平台；只有确认为 Web PC 后台时才使用本规则。
- 项目已有 Layout 时，只生成 content 区域。
- 不直接照搬 Figma 生成的 React + Tailwind 代码。
- 不在组件内写 `font-family`。
- 组件之间间距由父级控制。
- 组件内部不能无脑使用 `gap`。
- 页面负责 api / router / store，组件通过语义化事件 emit。
- 表格区域优先复用项目已有全局 Table。
- 响应式必须覆盖 1440 / 1024 / 768 / 520 / 375。
- 如果可以调用 chrome-devtools MCP，完成后截图验收。

## 写代码前必须输出

- 目标平台判断与依据
- 页面类型判断
- Layout 边界判断
- 本次生成范围
- 组件拆分方案
- 数据模型草案
- 语义事件设计
- 响应式策略表
- 风险点和待确认事项
