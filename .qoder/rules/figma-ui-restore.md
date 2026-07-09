# figma-ui-restore

当用户要求根据 Figma MCP 数据、截图、meta.json、reference.tsx 或节点信息还原 UI 时，应用本规则。

## 必须先判断目标平台

写代码前必须先判断目标平台：

- 小程序：微信小程序 / uni-app / Taro / 其他小程序运行时
- H5：移动 Web / WebView / 移动端浏览器
- Web PC 后台：PC Web / 后台管理系统 / 管理端页面

无法判断时必须先询问用户，不得默认 Web PC 后台。

## 规则优先级

1. 用户当前任务中的明确要求
2. 项目已有技术栈和代码规范
3. 平台规则
4. 公共规则
5. 默认偏好

平台规则与公共规则冲突时，以平台规则为准。

## 通用必须遵守

- 不要拿到 Figma 数据后直接写代码。
- 写代码前必须输出开发前确认报告，用户确认后再写代码。
- 不直接照搬 Figma 生成的 React + Tailwind 代码。
- 不把 `reference.tsx` 中框架化的 `className` 原样搬进业务代码。
- 不在组件内写 `font-family`。
- Figma 临时资源 URL 不得进入生产代码。
- 组件之间外部间距由父级控制。
- 组件内部不能无脑使用 `gap`。
- 页面负责 api / router / store / 权限 / 业务编排；组件通过语义化事件 emit / 触发。

## 小程序规则

目标平台为小程序时：

- 必须确认小程序运行时方言：微信原生 / uni-app / Taro React / Taro Vue / 其他。
- 必须确认 Figma 设计稿宽度 `dw`、图片资源目录、图标资源目录、页面壳边界和验收方式。
- 不得混写 `wx.*`、`uni.*`、`Taro.*`，除非项目已有明确兼容封装。
- 小程序不继承 Web PC 的 Sidebar / Header / Table / 1440 桌面断点假设。
- rpx 换算只用于 width、height、min/max width/height、line-height、图片宽高、图标容器宽高、卡片 / banner / 容器明确宽高。
- `font-size`、`font-weight`、padding、margin、color、opacity、z-index、百分比、资源路径不使用宽高 rpx 换算规则。
- `dw = 375`：白名单尺寸直接 `px * 2 = rpx`。
- `dw = 750`：白名单尺寸 `px = rpx`，单数 +1。
- 其他 `dw`：`floor((px / dw) * 750)`，单数 +1。
- 禁止四舍五入，禁止保留小数 rpx。
- 小程序本地背景图不得通过 WXSS `background-image` 引用，应使用 `image` 组件绝对定位复刻。
- 图片必须按语义选择 `mode`，不得全部使用同一种 mode。
- 状态栏、胶囊、navbar、tabBar、safe-area 必须先判断归属。
- 必须处理 styleIsolation / externalClasses，避免页面样式、组件样式、全局样式混用。
- 卡片整体可点且内部按钮也可点时，必须明确事件冒泡策略。
- 涉及 map / video / canvas / camera / input / textarea 等原生组件时，必须说明 cover-view / 同层渲染策略。
- 不得为了吸顶、滚动显隐、触底加载无脑把整个页面改成 scroll-view。
- 涉及开放能力、授权、分享、订阅消息、支付、位置、相机等能力时，不得当普通按钮处理。
- 必须评估包体、分包、CDN、setData 性能、长列表、图片加载体验和真机验收。

## Web PC 后台规则

目标平台为 Web PC 后台时：

- 项目已有 Layout 时，只生成 content 区域。
- 不默认生成 Sidebar / Header / Logo / Menu。
- 表格区域优先复用项目已有全局 Table。
- 响应式必须覆盖 1440 / 1024 / 768 / 520 / 375。
- 如果可以调用 chrome-devtools MCP，完成后截图验收；不可用时说明降级。

## 写代码前必须输出

- 目标平台判断与依据
- 页面类型判断
- 页面壳 / Layout 边界判断
- 本次生成范围
- 项目上下文扫描结果
- 小程序运行时方言判断（如适用）
- 资源目录与资源处理方案
- 组件拆分方案
- 数据模型草案
- 语义事件设计
- 适配 / 响应式策略表
- 风险点和待确认事项
