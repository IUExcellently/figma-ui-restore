# h5 · 移动 Web 范围、单位与验收

当目标产物为 H5、移动 Web、WebView 或移动端浏览器页面时，启用本目录规则。

## 必须确认

- 技术栈：Vue / React / 其他
- UI 组件库：Vant / NutUI / 自研 / 其他
- 单位方案：px / rem / vw / postcss-px-to-viewport / 项目自定义
- 页面运行环境：普通浏览器 / App WebView / 小程序 WebView
- safe-area 处理方式
- 预览和截图验收方式

## 与小程序区分

H5 不使用小程序 rpx 规则。

即使 Figma 设计稿宽度为 375px，也不得自动执行 `px * 2 → rpx`。

## 页面壳

需要判断：浏览器壳、App WebView 壳、fixed 顶部导航、fixed 底部操作区、safe-area bottom。底部 fixed 区域不得遮挡内容。

## 验收尺寸

默认检查：

- 320
- 375
- 390
- 414
- 430

如果项目有 PC 响应式或平板要求，再补充更大尺寸。
