---

name: "figma-ui-restore"
displayName: "Figma UI 高保真还原"
description: "把 Figma MCP 原始数据、截图、节点元数据和 UI 描述转成可维护、可适配、可验收的前端页面。当前版本优先支持后台管理系统 content 区域，强调 Layout 边界判断、业务模块拆分、设计 token、响应式策略、语义化事件和浏览器截图验收。"
keywords: ["figma", "figma mcp", "design-to-code", "ui restore", "frontend", "admin page", "backend admin", "vue", "react", "arco", "responsive", "layout", "高保真", "页面还原", "后台管理", "响应式"]
author: "Bel Veth"
------------------

# Figma UI 高保真还原 Power

当用户提供 Figma 链接、Figma MCP 原始数据、截图、`meta.json`、`reference.tsx`、页面结构说明，且希望把 UI 还原为可维护的前端代码时，启用本 Power。

当前版本优先处理后台管理系统页面，尤其是已有全局 Layout 的 content 区域。前台展示页、大屏页面、复杂详情页、复杂流程表单暂不作为第一版重点范围，后续可以通过迭代扩展。

## 启用后固定流程

启用本 Power 后，不要直接写代码。必须先进入“开发前确认阶段”，并输出开发前确认报告。

开发前确认报告至少包含：

1. 页面类型判断
2. Layout 边界判断
3. 本次生成范围：Layout / Content / 组件 / 局部模块
4. 项目上下文扫描计划
5. 项目技术栈与可复用组件判断
6. 设计 token 映射思路
7. 组件拆分思路
8. ViewModel 数据模型草案
9. 语义化事件设计
10. 响应式策略待确认点
11. 资源处理方案
12. 表格 / 表单 / 列表区域处理方案
13. 风险点与待确认事项

输出开发前确认报告后，必须停止，不得继续生成代码，直到用户明确回复确认开发。

## Steering 文件加载建议

根据当前阶段读取对应 steering 文件，不要机械一次性展开所有文件；但涉及对应阶段时必须读取对应规则。

* 页面类型、后台 Layout、生成范围：`steering/01-scope-and-layout.md`
* 字体、变量、资源、组件库、样式宪章：`steering/02-engineering-charter.md`
* 业务模块拆分、数据模型、emit 事件：`steering/03-component-and-events.md`
* 间距、flex、固定区 / 弹性区、文本溢出：`steering/04-spacing-and-layout.md`
* 1440 / 1024 / 768 / 520 / 375 响应式：`steering/05-responsive-rules.md`
* 表单、筛选栏、表格组件复用：`steering/06-forms-and-tables.md`
* 自检和 chrome-devtools MCP 截图验收：`steering/07-visual-qa.md`

## 核心边界

* 当前版本优先处理后台管理系统页面。
* 后台管理页面优先尊重项目已有 Layout。
* 如果项目已有 Sidebar / Header / Menu / Logo / Layout，只生成 content 区域。
* 不要根据单张 Figma 页面重复生成全局 Layout。
* 不要拿到 Figma 数据后直接写代码。
* 不要机械复制 Figma 图层结构。
* 不要直接照搬 Figma 生成的 React + Tailwind 参考代码。
* 不要把 Figma `reference.tsx` 中框架化的 `className` 原样搬进业务代码。
* 不要在组件内写 `font-family`。
* 不要把 Figma MCP 临时资源 URL 写成生产资源。
* 表格区域不手写，优先交给项目已有全局 Table 组件。
* 详情页暂不纳入第一版规则。
* 不要用一个媒体查询规则粗暴控制所有模块。
* 不要在展示组件内部直接调用 router / api / store。
* 不要把组件之间的外部间距写进子组件内部。
* 不要无脑使用 `gap` 处理所有组件内部 DOM 间距。
* chrome-devtools MCP 可用且页面可访问时，代码生成后必须截图检查；不可用时降级为结构化自检，并明确说明未执行截图验收。

## 默认工程原则

* Content 区域按业务模块拆分，不按 Figma 图层机械拆分。
* 页面负责接口请求、路由跳转、权限判断、数据组装和业务编排。
* 组件负责展示、局部交互和语义化 emit。
* 组件事件必须使用业务语义命名，例如 `view-detail`、`view-all`、`create-invite`，不要只暴露 `click` / `dblclick`。
* 列表、状态、统计卡、快捷入口、告警条必须数据驱动，不要硬编码重复 DOM。
* 组件接收 ViewModel，不直接依赖接口原始字段。
* 如果 `reference.tsx` 中的 `className` 来自 class 框架或原子类体系，必须先识别其语法和映射规则，再解析为对应 CSS 声明。
* `className` 解析结果只能作为样式事实来源之一，需要与 `meta.json`、Figma MCP 原始数据、设计截图真实渲染结果互相校验。
* 生成业务代码时，应按目标项目样式方案输出对应 CSS / Less / SCSS / CSS Modules / Tailwind 写法；除非目标项目本身使用同一套 class 框架，否则不允许原样复制 Figma 生成的 `className`。
* 当 `className` 与 Figma 实际渲染色值、尺寸或布局数据冲突时，以 Figma 实际渲染结果和原始数据为准，并在开发前确认报告中标记风险。
* 颜色类样式以 Figma 实际色值为最高依据；来源包括 `meta.json`、`reference.tsx`、Figma MCP 原始数据、设计截图中的真实渲染色值。
* 字体颜色、背景色、边框色、图标色、阴影色、渐变色，以及 `hover` / `active` / `selected` 状态色，必须先查项目已有变量、design token、`custom-figma-constant.less` 是否有完全相同色值。
* 只有变量色值与 Figma 实际色值完全一致时才复用；语义相近但色值不同的变量不允许强行复用。
* 没有相同色值且只在当前组件或模块少量出现时，允许直接在当前 class 中写具体色值；没有相同色值但重复出现或属于页面级核心颜色时，再沉淀到 `custom-figma-constant.less`。
* 新增颜色变量必须使用 `@figma-` 前缀，禁止创建 `@color-*` 这类过于通用、容易和项目或 Arco 冲突的变量；不允许把 Figma 节点 ID、图层名、组件名直接用于变量命名。
* 直接写色值时不允许使用行内 style。
* 字体 family 由项目根节点或全局样式统一控制，不在组件内声明。
* 响应式必须按业务模块分别声明，不允许一刀切。
* 组件之间的外部间距由父级页面或父级布局容器控制。
* 组件内部 `gap` 只用于同质元素的等距排列；不同语义元素间距使用语义 class + margin 控制。
* 横向布局必须判断固定区、弹性区和剩余区。
* 剩余内容区必须考虑 `min-width: 0`、ellipsis、Tooltip / title 等长文本溢出处理。

## 默认响应式断点

默认断点为：

* `1440px`：Figma 基准稿 / 大屏桌面
* `1024px`：窄桌面 / 横向平板
* `768px`：平板竖屏临界
* `520px`：手机布局策略临界
* `375px`：项目最小设计保障宽度

低于 `375px` 不作为主要适配目标，允许降级或横向滚动。

## 视觉验收

代码生成完成后必须输出结构化自检报告，至少检查：

* 是否误生成全局 Layout
* 是否忽略了组件内 `font-family`
* 是否识别并解析了 `reference.tsx` 中框架化的 `className`
* 是否把 `className` 解析结果转换成目标项目样式方案，而不是原样照搬
* 颜色类样式是否遵循 Figma 实际色值优先、色值完全一致才复用变量
* 直接写色值时是否仅写在当前 class 中，且没有使用行内 style
* 是否存在大量 magic number
* 组件拆分是否按业务模块进行
* 事件是否语义化 emit
* 是否把 router / api / store 放进展示组件
* 响应式是否覆盖 1440 / 1024 / 768 / 520 / 375
* 长文本是否有 ellipsis 和 Tooltip / title
* 是否出现横向溢出、模块错位、组件重叠、异常空白
* 表格是否复用项目全局 Table 组件

如果 chrome-devtools MCP 可用，并且项目可以启动或已有可访问页面地址，必须进行浏览器截图验收：

* 1440：对照 Figma 基准稿
* 1024：检查窄桌面布局
* 768：检查平板布局
* 520：检查手机布局策略
* 375：检查最小保障宽度

截图验收发现问题后，应先修复再复验。

## 默认技术栈偏好

默认示例偏向：

* Vue 3
* TypeScript
* Less
* Arco Design
* script setup

如果项目技术栈不同，必须以用户项目现状为准。
