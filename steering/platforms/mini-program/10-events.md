# mini-program · 事件规则

## 事件传播

微信原生小程序中：

- `bindtap`：允许事件冒泡。
- `catchtap`：阻止事件冒泡。

列表项整体可点击，内部按钮也可点击时，必须明确是否阻止冒泡。

错误示例：

```xml
<view class="card" bindtap="onCardTap">
  <button bindtap="onDeleteTap">删除</button>
</view>
```

推荐示例：

```xml
<view class="card" bindtap="onCardTap">
  <button catchtap="onDeleteTap">删除</button>
</view>
```

uni-app、Taro React、Taro Vue 应使用对应运行时的事件阻止冒泡写法，并优先参考项目已有代码风格。

## 业务语义事件

组件对外事件必须使用业务语义，不要暴露裸 `tap` / `click`。

推荐事件名：

- `select-item`
- `view-detail`
- `submit-form`
- `open-share`
- `load-more`
- `change-filter`
- `confirm-action`
- `cancel-action`

## 不直接向外抛 DOM Event

除非平台 API 必须，否则不要把原始事件对象直接作为业务数据向外抛。

推荐只向外抛业务需要的数据：

```js
this.triggerEvent('select-item', {
  id: item.id,
  item
})
```
