# mini-program · 代码生成契约

## 必须先确认运行时

目标平台为 `mini-program` 后，必须先确认运行时：

- 微信原生
- uni-app
- Taro React
- Taro Vue
- 其他

如果运行时无法确认，必须先从项目结构、文件扩展名、配置文件、已有页面代码中推断。仍无法确认时，不得直接生成最终代码。

## 微信原生

- 使用 WXML / WXSS / JS 或 TS。
- 事件使用 `bindtap` / `catchtap`。
- 路由使用项目封装或 `wx.navigateTo` / `wx.switchTab` 等。
- 样式写入 WXSS。
- 不使用 React / Vue 写法。

## uni-app

- 使用 Vue SFC。
- 路由使用项目封装或 `uni.*`。
- 页面注册参考 `pages.json`。
- 不生成微信原生 WXML 语法。
- 不混用 Taro API。

## Taro React

- 使用 React / TSX / JSX。
- 路由使用项目封装或 `Taro.*`。
- 不混用 `wx.*` / `uni.*`，除非项目已有兼容封装。
- 事件写法遵循项目已有 Taro React 风格。

## Taro Vue

- 使用 Vue SFC。
- 路由使用项目封装或 `Taro.*`。
- 不混用微信原生 WXML 或 uni-app 写法。

## 组件优先级

生成代码时优先级如下：

1. 项目已有业务组件。
2. 项目已有基础组件。
3. 平台原生组件。
4. 新增组件。

不得为了还原 Figma 重复造已有组件。

## 样式优先级

样式生成优先级如下：

1. 项目主题变量。
2. 项目 design token。
3. 项目 utility class。
4. 当前页面局部样式。
5. 新增组件私有样式。

不得把页面私有样式写入全局样式。
