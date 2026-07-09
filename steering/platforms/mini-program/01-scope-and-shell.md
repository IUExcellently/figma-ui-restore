# mini-program · 页面范围与页面壳边界

当目标产物为微信小程序、uni-app 小程序端、Taro 小程序端或其他小程序运行时时，启用本目录规则。

小程序是独立平台 Profile，不继承 Web PC 后台中的 Sidebar、Header、Table、1440 桌面断点等假设。

## 写代码前必须确认

- 小程序平台：微信原生 / uni-app / Taro / 支付宝 / 抖音 / 其他
- 代码形态：WXML + WXSS / Vue SFC / React + Taro / 其他
- Figma 设计稿宽度 `dw`
- 页面壳边界：状态栏、navigationBar、自定义 navbar、胶囊、tabBar、safe-area
- 资源目录：图片目录、图标目录、是否使用 CDN、是否允许分包
- 路由方式：`wx.*` / `uni.*` / `Taro.*` / 项目封装
- 请求封装和状态管理
- 预览 / 验收方式

## 页面壳识别

Figma 中可能包含：

- status bar / 系统状态栏
- navigationBar / 原生导航栏
- custom navbar / 自定义导航栏
- 微信右上角胶囊按钮区域
- tabBar
- safe-area bottom

处理规则：

- 状态栏、胶囊、原生导航栏截图默认不作为页面内容生成。
- 若顶部是业务自定义 navbar，必须确认项目是否已有全局自定义 navbar。
- 若底部是 tabBar，默认归属全局配置，不在单页重复生成，除非用户明确要求。
- 底部固定按钮、浮动操作区和自定义 tab 区必须避让 safe-area bottom。
- 自定义 navbar 必须避让 statusBarHeight 和胶囊区域。

## 页面滚动边界

- 默认使用页面自然滚动。
- 只有局部固定高度区域才使用 `scroll-view` 或平台等价组件。
- 不要无脑把整个页面包进 `scroll-view`。
- 页面有底部固定操作区时，内容区必须增加底部安全占位，避免最后一项被遮挡。
