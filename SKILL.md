---
name: figma-ui-restore
description: Use when restoring Figma MCP data, screenshots, node metadata, or UI descriptions into maintainable frontend code. 
First scope: backend/admin content pages with layout-boundary judgment, responsive modules, design-token mapping, semantic events, and browser screenshot QA when available.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# figma-ui-restore

本 Skill 用于把 Figma MCP 原始数据、设计截图、结构化元数据、人工补充规则，转成可维护、可适配、可验收的前端实现。

当前版本优先支持后台管理系统的 content 区域还原。前台展示页、大屏页面、复杂详情页、复杂流程表单暂不作为第一版重点范围，后续可以通过迭代补充。

## 适用场景

当用户提供以下任意输入，并希望进行 UI 高保真还原时，使用本 Skill：

* Figma MCP 原始数据
* Figma 节点截图
* Figma node metadata / layout json
* Figma 生成的 React / Tailwind 参考代码
* UI 截图或人工补充的设计说明
* 需要把后台管理页面还原为 Vue / React 前端代码

## 不允许直接做的事

* 不要拿到 Figma 数据后直接写代码。
* 不要机械复制 Figma 图层结构。
* 不要直接照搬 Figma 生成的 React + Tailwind 参考代码。
* 不要默认生成 Sidebar / Header / Logo / Menu 等全局 Layout。
* 不要在组件内写 `font-family`。
* 不要把 Figma MCP 临时资源 URL 写成生产资源。
* 不要把表格区域手写成原生 table；项目已有全局 Table 组件时必须复用。
* 不要用一个媒体查询规则粗暴控制所有模块。
* 不要在展示组件内部直接调用 router / api / store。
* 不要把组件之间的外部间距写进子组件内部。
* 不要无脑使用 `gap` 处理所有组件内部 DOM 间距。
* 不要在未确认项目上下文时擅自新增全局规范、全局 Layout 或全局组件。

## 固定执行顺序

1. 读取输入材料。
2. 判断页面类型。
3. 判断 Layout 边界。
4. 检查项目上下文。
5. 输出开发前确认报告。
6. 停止并等待用户确认。
7. 用户明确确认后再写代码。
8. 输出代码实现与变更说明。
9. 输出结构化自检报告。
10. 如果 chrome-devtools MCP 可用，进行浏览器截图验收。
11. 如果截图验收发现问题，先修复再复验。

## 规则文件读取策略

命中本 Skill 后，必须先读取与当前阶段相关的 steering / references 文件。不要一次性机械展开所有文件；但涉及对应阶段时，必须读取对应规则。

优先规则文件：

* `steering/01-scope-and-layout.md`
* `steering/02-engineering-charter.md`
* `steering/03-component-and-events.md`
* `steering/04-spacing-and-layout.md`
* `steering/05-responsive-rules.md`
* `steering/06-forms-and-tables.md`
* `steering/07-visual-qa.md`
* `references/preflight-report-template.md`
* `references/development-checklist.md`

## 开发前确认报告

在写代码前，必须先输出开发前确认报告。报告必须包含：

* 页面类型判断
* Layout 是否已有
* 本次生成范围：Layout / Content / 组件 / 局部模块
* 项目技术栈与可复用组件扫描结果
* 设计 token 映射方案
* 是否需要创建或更新 `custom-figma-constant.less`
* 组件拆分方案
* ViewModel 数据模型草案
* 语义化事件设计
* 响应式策略表
* 资源处理方案
* 表格 / 表单 / 列表区域处理方案
* 风险点与待确认事项

输出开发前确认报告后，必须停止，不得继续生成代码，直到用户明确回复确认开发。

## 项目上下文检查

如果无法确认以下信息，必须先提出问题或扫描项目后再继续：

* 项目是否已有后台 Layout
* 当前只生成 content 区域，还是需要生成通用 Layout
* 项目使用 Vue / React / 其他框架
* 项目使用 Less / SCSS / CSS Modules / Tailwind
* 项目是否已有全局 design token
* 项目是否已有全局 Table 组件
* 项目是否已有 Card / Tag / Tooltip / Empty / Form 等基础组件
* 项目路由跳转方式
* 项目请求封装方式
* 项目是否支持 chrome-devtools MCP 截图验收

## 核心工程规则

* 后台管理页面优先尊重项目已有 Layout。
* Figma 里的 Sidebar / Header / Menu / Logo 默认视为全局 Layout，不默认生成到当前页面。
* Content 区域按业务模块拆分，不按 Figma 图层机械拆分。
* 页面负责接口请求、路由跳转、权限判断、数据组装和业务编排。
* 组件负责展示、局部交互和语义化 emit。
* 组件事件必须使用业务语义命名，例如 `view-detail`、`view-all`、`create-invite`，不要只暴露 `click` / `dblclick`。
* 列表、状态、统计卡、快捷入口、告警条必须数据驱动，不要硬编码重复 DOM。
* 组件接收 ViewModel，不直接依赖接口原始字段。
* 展示组件内部默认不直接调用 router / api / store。
* 独立业务能力组件可以例外，但必须说明原因。

## 字体与样式规则

* 不管 Figma 节点中如何声明 `font-family`，组件内都必须忽略。
* 字体 family 由项目根节点或全局样式统一控制。
* 只还原 `font-size`、`line-height`、`font-weight`、颜色等非侵权排版属性。
* 字重映射：

    * Regular / 细体：`font-weight: 400`
    * Medium / 正常体：`font-weight: 500`
    * Semibold / Bold / 粗体：`font-weight: 600`
* 颜色、字号、行高、圆角、阴影、间距、断点优先复用项目已有变量。
* 如果项目中没有对应变量，允许在全局公共样式目录中创建或更新 `custom-figma-constant.less`。
* 创建变量前必须先检查当前项目是否已有同色值或同语义变量。
* 变量命名必须语义化，不允许使用 Figma 节点 ID 或图层名污染代码。

## 间距与布局规则

* 组件之间的外部间距由父级页面或父级布局容器控制。
* 子组件不应默认携带外部 `margin`。
* 如果组件之间间距一致，父级可以使用 `gap` 或 `> * + *` 控制。
* 如果组件之间间距不一致，优先使用业务分组；无法分组时，在页面层使用布局项 class 控制。
* 组件内部不能无脑使用 `gap`。
* `gap` 只适合同质元素的等距排列。
* 不同语义元素之间的间距，优先使用语义 class + margin 控制。
* Figma 绝对定位节点的间距，应通过坐标计算设计意图：`nextY - (prevY + prevHeight)`。
* 计算出的间距要归一到项目 spacing token，避免生成大量奇怪像素值。
* 横向布局必须判断固定区、弹性区、剩余区。
* 固定内容区使用 `flex: 0 0 auto`。
* 剩余内容区使用 `flex: 1 1 auto` + `min-width: 0`。
* 重要文本超出时使用 ellipsis，并提供 Tooltip 或 title 展示完整内容。
* 装饰图、背景图、浮层角标不参与主内容流布局。

## 响应式规则

默认断点：

* `1440px`：Figma 基准稿 / 大屏桌面
* `1024px`：窄桌面 / 横向平板
* `768px`：平板竖屏临界
* `520px`：手机布局策略临界
* `375px`：项目最小设计保障宽度

要求：

* 不要用一个断点规则粗暴控制所有模块。
* 每个业务模块必须单独声明响应式行为。
* 默认使用 flex / inline-flex / flex-wrap / flex-basis / media query。
* 避免使用 inline-block 做主要布局。
* 只有规整宫格、统计宫格、图片宫格等明确结构才优先使用 grid。
* 后台页面优先关注 content 可用宽度，不要只机械依赖 viewport。
* 低于 375px 不作为主要适配目标，允许降级或横向滚动。
* 没有移动端设计稿时，必须先输出响应式策略，不得直接写代码。

## 表格与表单规则

表格区域：

* 如果项目已有全局 Table 组件，不根据 Figma 手写 table。
* 只识别表格外层容器、标题区、操作区、搜索区、分页区。
* 表格列配置、接口字段、操作列由页面逻辑和项目 Table 组件处理。

表单区域：

* 先判断是筛选表单还是编辑 / 新增表单。
* PC 默认一行两个表单项。
* 小于 768px 或 520px 后，默认一行一个并换行。
* 搜索输入、长文本输入、日期范围选择器、开始结束时间选择器等特殊控件可以独占一行。
* 筛选栏表单优先紧凑；编辑表单优先可读性和校验清晰。

## 资源处理规则

* Figma MCP 临时资源 URL 不允许直接作为生产资源。
* 装饰图、图标、Logo 必须下载到本地 assets，或替换成项目已有图标 / 资源。
* 图标优先使用项目已有图标库。
* Logo 和品牌资源优先复用项目已有资源。
* 装饰性资源必须标记为 decorative，不影响主布局，不参与交互。

## 视觉验收规则

开发完成后必须输出结构化自检报告，至少检查：

* 是否误生成全局 Layout
* 是否忽略了组件内 `font-family`
* 是否复用或创建了合理 design token
* 是否存在裸色值或大量 magic number
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

如果 chrome-devtools MCP 不可用，必须明确说明已降级为结构化自检，不得声称完成截图验收。

## 默认技术栈偏好

默认示例偏向：

* Vue 3
* TypeScript
* Less
* Arco Design
* script setup

如果项目技术栈不同，必须以用户项目现状为准。
