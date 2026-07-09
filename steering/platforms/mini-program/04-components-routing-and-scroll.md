# mini-program · 组件、路由、原生组件与滚动

## 页面与组件职责

页面负责：

- 小程序页面生命周期
- 路由跳转
- 接口请求
- 权限判断
- 下拉刷新 / 上拉加载
- ViewModel 转换

展示组件负责：

- 渲染 UI
- 局部交互
- 触发语义化事件

展示组件不直接调用 `wx.navigateTo`、`uni.navigateTo`、`Taro.navigateTo` 或请求接口，除非该组件本身是明确的独立业务能力组件，并在开发前确认报告中说明原因。

## 语义化事件

不要只暴露 `tap` / `click`。推荐事件：

```text
view-detail
select-item
submit-form
open-share
switch-tab
load-more
refresh
```

事件参数优先携带业务对象或业务 ID，不携带原始 DOM / Event，除非平台 API 必须。

## 原生组件限制

遇到小程序原生组件时，优先使用平台组件能力，不要强行用普通 `view` 复刻：

- `map`
- `video`
- `camera`
- `canvas`
- `textarea`
- `input`
- `picker`
- `scroll-view`
- `swiper`

涉及 `map` / `video` / `camera` / `canvas` 等原生层组件时，需要注意层级、`z-index`、`cover-view` 等平台限制，并在风险点中说明。

## 滚动与固定区域

- 默认使用页面自然滚动。
- 只有局部固定高度区域才使用 `scroll-view`。
- 不要无脑把整个页面包进 `scroll-view`。
- 底部 fixed 操作区必须避让 safe-area bottom。
- 内容区需要底部占位，避免最后内容被固定按钮或 tabBar 遮挡。
- 下拉刷新、上拉加载、分页请求由页面层处理。
