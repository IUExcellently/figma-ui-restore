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
- `live-player`
- `live-pusher`

## 原生组件层级

涉及以下原生层组件时，必须单独处理层级问题：

- map
- video
- canvas
- camera
- live-player
- live-pusher
- textarea
- input
- picker
- scroll-view
- swiper

规则：

- 不得假设普通 `view`、`position: fixed`、`z-index` 一定能覆盖原生组件。
- 需要覆盖时，必须判断是否使用 `cover-view` / `cover-image` 或当前平台的同层渲染能力。
- `cover-view` 内部结构受限，不得默认嵌套任意自定义组件。
- 如果设计稿要求浮层、弹窗、吸顶栏覆盖原生组件，必须在实现方案中说明层级策略。

## 滚动与固定区域

- 默认使用页面自然滚动。
- 只有局部固定高度区域才使用 `scroll-view`。
- 不要无脑把整个页面包进 `scroll-view`。
- 底部 fixed 操作区必须避让 safe-area bottom。
- 内容区需要底部占位，避免最后内容被固定按钮或 tabBar 遮挡。
- 下拉刷新、上拉加载、分页请求由页面层处理。


## 页面滚动与吸顶

页面级滚动优先使用页面自然滚动。

页面级滚动监听归页面层处理：

- 微信原生：`onPageScroll`
- uni-app：`onPageScroll`
- Taro：`usePageScroll` 或页面生命周期

不得为了实现吸顶、滚动显隐、触底加载，把整个页面无脑改成 `scroll-view`。

## 吸顶归属

实现吸顶前必须判断吸顶对象属于哪一类：

- 原生 navbar 吸顶
- 自定义 navbar 吸顶
- tab / filter bar 吸顶
- 局部 scroll-view 内吸顶
- 底部 fixed 操作栏

不同吸顶对象必须采用不同实现方案。

## scroll-view 使用条件

只有以下场景优先考虑 `scroll-view`：

- 页面中存在固定高度的局部滚动区域
- 横向分类列表
- 弹窗内列表
- tab 内容区域局部滚动
- 虚拟列表或局部分页容器

使用 `scroll-view` 时必须确认：

- 高度
- 滚动方向
- 是否需要触底事件
- 是否需要下拉刷新
- 是否需要隐藏滚动条
- 是否影响页面整体回弹
- 是否影响吸顶和 fixed 布局

## 滚动性能

高频滚动事件中：

- 不得频繁 `setData` 大对象。
- 不得频繁更新整个列表。
- 应节流。
- 只更新必要字段。
- 避免在滚动过程中触发复杂计算。

事件冒泡和业务事件详见 `10-events.md`；setData、长列表和生命周期详见 `06-performance-and-package.md`。
