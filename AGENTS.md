# AGENTS.md

本仓库包含 `figma-ui-restore` 工作流。

当用户要求根据 Figma MCP 数据、设计截图、meta.json、reference.tsx 或手工规格还原后台管理系统页面时，优先使用根目录 `SKILL.md` 与 `steering/` 中的规则。

关键约束：

- 先确认页面类型和 Layout 边界，再写代码。
- 已有 Layout 时只生成 content 区域。
- 不在组件内写 font-family。
- Figma `reference.tsx` 中框架化的 `className` 要先解析成 CSS 声明，再按目标项目样式方案实现；不要原样照搬。
- icon 字号 / SVG 尺寸优先取语义图标容器或直接包裹层的 `size-[...]` / `w/h`，不要用内部 Vector / img 的 inset 切片尺寸。
- 项目使用 Arco Design 时，icon 尺寸直接映射到 Icon 组件 `size` 属性，不额外包 DOM。
- 颜色类样式以 Figma 实际色值优先，先查已有变量；只有色值完全一致才复用。
- 没有相同色值时，少量局部颜色可直接写在当前 class；重复或页面级核心颜色再沉淀到 `custom-figma-constant.less`。
- 新增颜色变量使用 `@figma-` 前缀，不使用 Figma 节点 ID、图层名、组件名命名。
- 组件之间外部间距由父级控制。
- 组件内部 gap 不能无脑使用。
- 页面处理路由、接口、权限；组件通过语义化事件 emit。
- 表格区域优先复用项目全局 Table。
- 响应式覆盖 1440 / 1024 / 768 / 520 / 375。
- chrome-devtools MCP 可用时必须截图验收，不可用时说明降级。
