# 03 · 业务模块拆分、数据模型与事件边界

## 拆分原则

后台 content 区域按业务模块拆，不按 Figma 图层机械拆。

推荐顺序：

1. 业务模块
2. 复用价值
3. 视觉复杂度

## 页面与组件职责

### Page 页面容器

负责：

- 接口请求
- 路由跳转
- 权限判断
- 数据组装
- 业务流程编排
- ViewModel 转换

### Feature 业务模块组件

负责：

- 展示某个业务区域
- 局部 UI 状态
- 语义化事件抛出

### UI 展示组件

负责：

- 接收 props
- 渲染 UI
- emit 语义事件
- 不知道路由和接口

## 事件规则

组件不对外暴露裸 `click` / `dblclick`，必须暴露业务语义事件。

推荐：

```text
@open-help
@create-invite
@self-service
@view-all
@view-detail
@refresh-list
@approve-order
@reject-order
```

不推荐：

```text
@click
@item-click
@card-click
@handle-click
```

## 事件携带参数

优先携带业务对象或业务 ID，不携带 DOM Event。

```ts
emit('view-detail', item)
emit('approve-order', item.id)
```

## 数据驱动规则

以下内容必须数据驱动：

- 列表
- 状态标签
- 统计卡
- 快捷入口
- 告警条
- 操作按钮

允许 mock，但 mock 应放在独立位置，如：

- `mock.ts`
- `types.ts`
- `use-xxx.ts`

不要在 template 里硬写多份重复 DOM。

## ViewModel 规则

组件接收 ViewModel，不直接依赖接口原始字段。

流程：

```text
接口原始数据 → 页面 / composable 转换 → ViewModel → 组件 props
```

## 独立业务组件例外

如果组件本身是完整业务能力，例如组织架构选择器、用户选择弹窗、上传头像组件，可以内部调接口。

但必须说明原因，不能默认让普通展示组件调接口。

