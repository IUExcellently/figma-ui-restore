# mini-program · 运行时方言规则

目标平台命中 `mini-program` 后，必须继续判断当前项目的小程序运行时方言。未确认运行时方言前，不得直接生成具体业务代码。

## 常见方言

- 微信原生小程序：WXML + WXSS + JS/TS
- uni-app：Vue SFC + `pages.json` + `uni.*`
- Taro React：TSX/JSX + `Taro.*`
- Taro Vue：Vue SFC + `Taro.*`
- 其他小程序框架

## 判断依据

优先从项目结构和已有代码判断：

- 微信原生：`app.json`、`app.wxss`、`.wxml`、`.wxss`
- uni-app：`pages.json`、`manifest.json`、`.vue` 页面、`uni.` API
- Taro React：`app.config.ts`、`project.config.json`、`.tsx` 页面、`@tarojs/*`
- Taro Vue：`app.config.ts`、`.vue` 页面、`@tarojs/*`

如果仓库同时存在多套线索，以目标页面所在目录和已有同类页面为准。

## 微信原生小程序

如果项目是微信原生小程序：

- 视图文件使用 `.wxml`。
- 样式文件使用 `.wxss`。
- 逻辑文件使用 `.js` / `.ts`。
- 事件使用 `bindtap` / `catchtap`。
- 路由优先使用项目封装；没有封装时再使用 `wx.navigateTo`、`wx.redirectTo`、`wx.switchTab`、`wx.navigateBack`。
- 不得生成 React / Vue 语法。

## uni-app

如果项目是 uni-app：

- 优先生成 Vue SFC。
- 路由优先使用项目封装；没有封装时再使用 `uni.navigateTo`、`uni.redirectTo`、`uni.switchTab`、`uni.navigateBack`。
- 页面配置优先参考 `pages.json`。
- 不得生成微信原生 WXML 语法。
- 不得混用 Taro API。

## Taro React

如果项目是 Taro React：

- 优先生成 TSX / JSX。
- 路由优先使用项目封装；没有封装时再使用 `Taro.navigateTo`、`Taro.redirectTo`、`Taro.switchTab`、`Taro.navigateBack`。
- 事件按照项目现有 Taro React 写法处理。
- 不得混用 `wx.*` / `uni.*`，除非项目已有明确兼容封装。

## Taro Vue

如果项目是 Taro Vue：

- 优先生成 Vue SFC。
- 路由优先使用项目封装；没有封装时再使用 `Taro.*`。
- 不得混用微信原生 WXML 或 uni-app 写法。

## 方言不明确时

如果无法从项目结构判断运行时方言：

- 不直接生成最终代码。
- 先输出需要确认的信息。
- 或根据仓库已有文件风格选择最接近的方言，并在开发前确认报告中明确说明假设和风险。
