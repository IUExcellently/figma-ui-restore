# mini-program · 组件样式隔离规则

## 页面样式与组件样式必须区分

生成代码前必须判断当前 UI 应该落在：

- 页面样式
- 自定义组件样式
- 全局样式
- 业务公共样式

不得把所有样式无脑写入页面样式或全局样式。

## styleIsolation

微信原生小程序自定义组件需要注意 `styleIsolation`。

常见取值包括：

- `isolated`
- `apply-shared`
- `shared`
- `page-isolated`
- `page-apply-shared`
- `page-shared`

生成或修改自定义组件时，必须检查项目已有组件的 `styleIsolation` 习惯。

## externalClasses

如果组件需要让外部控制样式，应优先考虑项目是否已有 `externalClasses` 规范。

适合 externalClasses 的场景：

- 外层容器 class
- 标题 class
- 图标 class
- 按钮 class
- 状态标签 class

不建议为了局部还原 Figma，把组件内部所有节点都暴露 externalClasses。

## 全局样式使用限制

不得为了让一个组件还原设计稿，把组件私有样式写入 `app.wxss`。

只有以下场景可以考虑全局样式：

- 全局 reset
- 全局 typography
- 全局主题变量
- 全局安全区变量
- 项目已有 utility class
