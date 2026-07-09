---

name: "figma-ui-restore"
displayName: "Figma UI 高保真还原"
description: "把 Figma MCP 原始数据、截图、节点元数据和 UI 描述转成可维护、可适配、可验收的前端页面。支持小程序、H5 / 移动 Web、Web PC / 后台管理系统，通过平台路由加载公共规则和平台专属规则。"
keywords: ["figma", "figma mcp", "design-to-code", "ui restore", "frontend", "mini program", "小程序", "h5", "mobile web", "admin page", "backend admin", "vue", "react", "taro", "uni-app", "responsive", "高保真", "页面还原"]
author: "Bel Veth"
------------------

# Figma UI 高保真还原 Power

当用户提供 Figma 链接、Figma MCP 原始数据、截图、`meta.json`、`reference.tsx`、页面结构说明，且希望把 UI 还原为可维护的前端代码时，启用本 Power。

当前支持三个平台 Profile：

1. `mini-program`：微信小程序、uni-app 小程序端、Taro 小程序端、其他小程序运行时。
2. `h5`：H5、移动 Web、WebView、移动端浏览器页面。
3. `web-pc-admin`：PC Web、后台管理系统、管理端页面。

## 启用后固定流程

启用本 Power 后，不要直接写代码。必须先进入“开发前确认阶段”，并输出开发前确认报告。

固定顺序：

1. 读取 `steering/00-platform-router.md`。
2. 判断目标平台：小程序 / H5 / Web PC 后台。
3. 读取 `steering/common/` 中相关公共规则。
4. 读取 `steering/platforms/<platform>/` 中相关平台规则。
5. 扫描项目上下文。
6. 输出开发前确认报告。
7. 停止并等待用户确认。
8. 用户确认后再开发。
9. 开发完成后按平台规则自检和验收。

## 规则优先级

1. 用户当前任务中的明确要求。
2. 项目已有技术栈、目录结构和代码规范。
3. 当前目标平台规则：`steering/platforms/<platform>/`。
4. 公共规则：`steering/common/`。
5. Power 默认偏好。

平台规则与公共规则冲突时，以平台规则为准。

## Steering 文件加载建议

必读入口：

* 平台路由：`steering/00-platform-router.md`
* 跨平台基础：`steering/common/01-cross-platform-foundation.md`

按平台读取：

* 小程序：先读 `steering/platforms/mini-program/README.md`，再按阶段读取 `steering/platforms/mini-program/`
* H5：`steering/platforms/h5/`
* Web PC 后台：`steering/platforms/web-pc-admin/`，并兼容读取 `steering/01-07`

## 开发前确认报告至少包含

1. 目标平台与判断依据。
2. 单尺寸 / 多尺寸输入判断。
3. 页面类型判断。
4. 页面壳 / Layout 边界判断。
5. 本次生成范围。
6. 项目上下文扫描计划。
7. 项目技术栈与可复用组件判断。
8. 多尺寸源数据扫描结果（如存在）。
9. 基准稿 / 参考稿 / 状态变体归类。
10. 设计 token 映射思路。
11. 资源目录与资源处理方案。
12. Icon / 图片 / 背景图处理方案。
13. 组件拆分思路。
14. ViewModel 数据模型草案。
15. 语义化事件设计。
16. 适配 / 响应式策略。
17. 平台验收方式。
18. 风险点与待确认事项。

输出开发前确认报告后，必须停止，不得继续生成代码，直到用户明确回复确认开发。

## 小程序规则加载顺序

目标平台为 `mini-program` 时，推荐按阶段加载：

1. `00-runtime-dialect.md`
2. `01-scope-and-shell.md`
3. `02-rpx-size-rules.md`
4. `03-assets-and-background-images.md`
5. `04-components-routing-and-scroll.md`
6. `05-qa.md`
7. `06-performance-and-package.md`
8. `07-mini-program-codegen-contract.md`
9. `08-style-isolation.md`
10. `09-text-overflow.md`
11. `10-events.md`
12. `11-open-capabilities.md`

## 小程序关键边界

* 小程序不继承 Web PC 的 Sidebar / Header / Table / 1440 桌面断点假设。
* 必须先确认小程序运行时方言：微信原生、uni-app、Taro React、Taro Vue 或其他；不得混写 `wx.*`、`uni.*`、`Taro.*`。
* 写代码前必须确认 Figma 设计稿宽度 `dw`。
* rpx 换算只用于 width、height、min/max width/height、line-height、图片宽高、图标容器宽高、卡片 / banner / 容器明确宽高。
* `font-size`、`font-weight`、padding、margin、color、opacity、z-index、百分比、资源路径不使用宽高 rpx 换算规则。
* `dw = 375`：白名单尺寸直接 `px * 2 = rpx`。
* `dw = 750`：白名单尺寸 `px = rpx`，单数 +1。
* 其他 `dw`：`floor((px / dw) * 750)`，单数 +1；禁止四舍五入和小数 rpx。
* 图片、图标、装饰图必须让用户指定资源目录。
* 本地背景图不得通过 WXSS `background-image` 引用，应使用 `image` 组件绝对定位复刻。
* 状态栏、胶囊、navbar、tabBar、safe-area 必须先判断归属。
* 必须关注 styleIsolation / externalClasses、事件冒泡、原生组件层级、页面自然滚动与吸顶归属。
* 涉及开放能力、授权、分享、订阅消息、支付、位置、相机等能力时，不得当普通按钮处理。
* 必须评估包体、分包、CDN、setData 性能、长列表、图片加载体验和真机验收。

## Web PC 后台兼容边界

* 后台管理页面优先尊重项目已有 Layout。
* 如果项目已有 Sidebar / Header / Menu / Logo / Layout，只生成 content 区域。
* 表格区域不手写，优先交给项目已有全局 Table 组件。
* 响应式必须按业务模块分别声明。
* chrome-devtools MCP 可用且页面可访问时，代码生成后必须截图检查；不可用时降级为结构化自检，并明确说明未执行截图验收。
