# AGENTS.md

本仓库包含 `figma-ui-restore` 工作流。

当用户要求根据 Figma MCP 数据、设计截图、meta.json、reference.tsx 或手工规格还原 UI 时，优先使用根目录 `SKILL.md` 与 `steering/` 中的规则。

关键约束：

- 先判断目标平台：小程序 / H5 / Web PC 后台；无法判断时先问用户。
- 先读取 `steering/00-platform-router.md`，再读取 `steering/common/` 和对应 `steering/platforms/<platform>/`。
- 平台规则优先级高于公共规则。
- 写代码前必须输出开发前确认报告，用户确认后再写代码。
- 不在组件内写 font-family。
- Figma `reference.tsx` 中框架化的 `className` 要先解析成 CSS 声明，再按目标项目样式方案实现；不要原样照搬。
- icon 字号 / SVG 尺寸优先取语义图标容器或直接包裹层的 `size-[...]` / `w/h`，不要用内部 Vector / img 的 inset 切片尺寸。
- 颜色类样式以 Figma 实际色值优先，先查已有变量；只有色值完全一致才复用。
- 没有相同色值时，少量局部颜色可直接写在当前 class；重复或页面级核心颜色再沉淀到 `custom-figma-constant.less`。
- 新增颜色变量使用 `@figma-` 前缀，不使用 Figma 节点 ID、图层名、组件名命名。
- 组件之间外部间距由父级控制。
- 组件内部 gap 不能无脑使用。
- 页面处理路由、接口、权限；组件通过语义化事件 emit / 触发。

小程序关键约束：

- 小程序不继承 Web PC 的 Sidebar / Table / 1440 桌面断点假设。
- 必须确认 Figma 设计稿宽度 `dw`。
- 宽高 rpx 换算只用于 width、height、min/max width/height、line-height、图片宽高、图标容器宽高、卡片 / banner / 容器明确宽高。
- font-size、padding、margin 不使用宽高 rpx 换算规则。
- `dw = 375` 时白名单尺寸 `px * 2 = rpx`；`dw = 750` 时 `px = rpx` 且单数 +1；其他宽度用 `floor((px / dw) * 750)` 且单数 +1。
- 图片、图标、装饰图必须让用户指定资源目录。
- 小程序本地背景图不得用 WXSS `background-image` 引用，应使用 `image` 组件绝对定位复刻。
- 状态栏、胶囊、navbar、tabBar、safe-area 必须先判断归属。

Web PC 后台关键约束：

- 已有 Layout 时只生成 content 区域。
- 表格区域优先复用项目全局 Table。
- 响应式覆盖 1440 / 1024 / 768 / 520 / 375。
- chrome-devtools MCP 可用时必须截图验收，不可用时说明降级。
