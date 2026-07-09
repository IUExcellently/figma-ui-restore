---
name: figma-ui-restore
description: Use when restoring Figma MCP data, screenshots, node metadata, reference.tsx, meta.json, or UI descriptions into maintainable frontend code for mini-program, H5/mobile web, or Web PC/admin pages. Includes platform routing, Figma fact extraction, design-token mapping, semantic events, responsive/adaptive strategy, mini-program rpx width/height rules, asset handling, and visual QA.
---

# figma-ui-restore

本 Skill 用于把 Figma MCP 原始数据、设计截图、结构化元数据、`reference.tsx`、人工补充规则，转成可维护、可适配、可验收的前端实现。

当前支持三个平台 Profile：

1. `mini-program`：微信小程序、uni-app 小程序端、Taro 小程序端、其他小程序运行时。
2. `h5`：H5、移动 Web、WebView、移动端浏览器页面。
3. `web-pc-admin`：PC Web、后台管理系统、管理端页面。

Web PC 后台仍是最成熟的 Profile；小程序和 H5 通过平台目录提供专属规则。平台规则优先级高于公共规则。

## 不允许直接做的事

* 不要拿到 Figma 数据后直接写代码。
* 不要在未判断目标平台时默认套用 Web PC 后台规则。
* 不要机械复制 Figma 图层结构。
* 不要直接照搬 Figma 生成的 React + Tailwind 参考代码。
* 不要把 Figma `reference.tsx` 中框架化的 `className` 原样搬进业务代码。
* 不要在组件内写 `font-family`。
* 不要把 Figma MCP 临时资源 URL 写成生产资源。
* 不要在未确认项目上下文时擅自新增全局规范、全局 Layout、全局组件或资源目录。
* 不要把小程序 rpx 换算规则套到 H5 或 Web PC。

## 固定执行顺序

1. 读取输入材料。
2. 读取 `steering/00-platform-router.md`，判断目标平台：`mini-program` / `h5` / `web-pc-admin`。
3. 判断输入类型：单尺寸 / 单页面多尺寸 / 同尺寸多状态 / 多页面多尺寸。
4. 按平台判断页面类型和页面壳 / Layout 边界。
5. 检查项目上下文、技术栈、资源目录、可复用组件和验收方式。
6. 读取 `steering/common/` 中当前阶段相关规则。
7. 读取 `steering/platforms/<platform>/` 中当前阶段相关规则。
8. 输出开发前确认报告。
9. 停止并等待用户确认。
10. 用户明确确认后再写代码。
11. 输出代码实现与变更说明。
12. 输出结构化自检报告。
13. 按平台规则进行浏览器、小程序开发者工具或其他预览验收；不可用时说明降级。

## 规则文件读取策略

命中本 Skill 后，不要一次性机械展开所有文件；但涉及对应阶段时，必须读取对应规则。

必读入口：

* `steering/00-platform-router.md`
* `steering/common/01-cross-platform-foundation.md`

按平台读取：

* 小程序：`steering/platforms/mini-program/`
* H5：`steering/platforms/h5/`
* Web PC 后台：`steering/platforms/web-pc-admin/`，并兼容读取现有 `steering/01-07` 文件

常用模板：

* `references/preflight-report-template.md`
* `references/development-checklist.md`
* 小程序补充：`references/platforms/mini-program/preflight-template.md`

## 规则优先级

优先级从高到低：

1. 用户当前任务中的明确要求。
2. 项目已有技术栈、目录结构和代码规范。
3. 当前目标平台规则：`steering/platforms/<platform>/`。
4. 公共规则：`steering/common/`。
5. Skill 默认偏好。

当平台规则与公共规则冲突时，以平台规则为准。

## 开发前确认报告

写代码前必须先输出开发前确认报告。报告必须包含：

* 目标平台与判断依据。
* 单尺寸 / 多尺寸输入判断。
* 页面类型判断。
* 页面壳 / Layout 边界判断。
* 本次生成范围：Layout / 页面内容 / 组件 / 局部模块 / 资源。
* 项目技术栈与可复用组件扫描结果。
* 多尺寸源数据扫描结果（如存在）。
* 基准稿 / 参考稿 / 状态变体归类（如存在多尺寸或多状态）。
* 设计 token 映射方案。
* 资源目录与资源处理方案。
* Icon / 图片 / 背景图处理方案。
* 组件拆分方案。
* ViewModel 数据模型草案。
* 语义化事件设计。
* 适配 / 响应式策略表。
* 验收方式。
* 风险点与待确认事项。

输出开发前确认报告后，必须停止，不得继续生成代码，直到用户明确回复确认开发。

## 平台上下文检查

无法确认以下信息时，必须先提出问题或扫描项目后再继续。

### 通用

* 目标平台。
* 框架与样式方案。
* `reference.tsx` 中 `className` 使用的框架或规则。
* 项目是否已有 design token / 变量文件。
* 项目是否已有基础组件、图标方案、资源目录。
* 项目路由方式、请求封装、状态管理。
* 项目可用的预览 / 截图 / 验收方式。

### 小程序

* 小程序平台：微信原生 / uni-app / Taro / 支付宝 / 抖音 / 其他。
* 代码形态：WXML + WXSS / Vue SFC / React + Taro / 其他。
* Figma 设计稿宽度 `dw`。
* status bar / navigationBar / custom navbar / 胶囊 / tabBar / safe-area 边界。
* 图片资源输出目录、图标资源输出目录、是否使用 CDN、是否允许分包。
* 本地背景图是否需要转为 `image` 绝对定位实现。

### H5

* 是否为普通移动 Web、App WebView 或小程序 WebView。
* 单位方案：px / rem / vw / viewport 转换 / 项目自定义。
* safe-area 与 fixed 顶底区域策略。

### Web PC 后台

* 项目是否已有后台 Layout / Sidebar / Header / Menu。
* 当前只生成 content 区域，还是需要生成通用 Layout。
* 项目是否已有全局 Table 组件。
* chrome-devtools MCP 是否可用。

## 小程序关键规则摘要

小程序详细规则见 `steering/platforms/mini-program/`。核心摘要：

* 平台规则优先于 common，不继承 Web PC 的 Sidebar / Table / 1440 断点假设。
* 写代码前必须确认设计稿宽度 `dw`。
* rpx 换算只用于严格白名单：width、height、min/max width/height、line-height、图片宽高、图标容器宽高、卡片 / banner / 容器明确宽高。
* `font-size`、`font-weight`、padding、margin、color、opacity、z-index、百分比、资源路径不使用宽高 rpx 换算规则。
* `dw = 375`：白名单尺寸直接 `px * 2 = rpx`。
* `dw = 750`：白名单尺寸 `px = rpx`，单数 +1。
* 其他 `dw`：`base = floor((px / dw) * 750)`，单数 +1；禁止四舍五入和小数 rpx。
* 图片、图标、装饰图必须让用户指定资源目录。
* Figma 临时资源 URL 不得进入生产代码。
* 小程序本地背景图不得通过 WXSS `background-image` 引用，应使用 `image` 组件绝对定位到容器底层复刻；纯色和可安全使用的渐变优先用 CSS。
* 图片必须根据语义选择 `mode`，不得默认全部同一种 mode。
* 状态栏、胶囊、navbar、tabBar、safe-area 必须先判断归属。

## Web PC 后台兼容规则摘要

Web PC / 后台管理系统继续遵循现有 `steering/01-07`：

* 后台管理页面优先尊重项目已有 Layout。
* Figma 里的 Sidebar / Header / Menu / Logo 默认视为全局 Layout，不默认生成到当前页面。
* 项目已有 Layout 时，只生成 content 区域。
* 表格区域优先复用项目全局 Table。
* 响应式覆盖 `1440 / 1024 / 768 / 520 / 375`。
* chrome-devtools MCP 可用且页面可访问时，必须截图验收。

## 默认技术栈偏好

默认示例偏向 Vue 3、TypeScript、Less、Arco Design、script setup，但必须以用户项目现状和目标平台为准。
