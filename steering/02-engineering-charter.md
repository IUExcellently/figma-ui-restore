# 02 · 工程宪章：字体、变量、资源、组件库

## 字体 family 宪章

不管 Figma 中怎么给模块设置字体，都必须忽略 `font-family`。

原因：字体由项目根节点或全局样式统一控制，同时避免字体授权 / 侵权风险。

组件内禁止出现：

```css
font-family: ...;
```

## 字重映射

- 细体 / Regular：`font-weight: 400`
- 正常体 / Medium：`font-weight: 500`
- 粗体 / Semibold / Bold：`font-weight: 600`

## 设计变量文件

允许 AI 在全局公共样式目录创建：

```text
custom-figma-constant.less
```

创建前必须先查找项目已有变量，例如：

- `src/styles`
- `src/assets/styles`
- `src/theme`
- `src/common/styles`
- `index.less`
- `variables.less`
- `theme.less`

## 变量创建规则

先查已有变量：

1. 同色值 + 同语义存在：复用已有变量。
2. 同色值但语义不同：优先复用基础色变量，必要时新增语义别名。
3. 不存在：写入 `custom-figma-constant.less`。

变量必须语义命名，禁止使用 Figma 图层 ID 命名。

推荐：

```less
@figma-color-primary: #00aaa6;
@figma-color-text-1: #1d2129;
@figma-section-gap: 24px;
@figma-card-radius: 8px;
```

禁止：

```less
@figma-1364-8031-color: #ffece8;
@figma-frame-427318709-gap: 16px;
```

## 变量覆盖范围

颜色、字号、行高、字重、圆角、阴影、间距、断点，只要重复出现两次及以上，优先抽为变量。

## UI 组件库优先

后台常见组件必须优先复用项目已有能力：

- Button
- Tooltip
- Tag
- Card
- Form
- Select
- DatePicker / RangePicker
- Modal / Drawer
- Empty
- Table

不要因为 Figma 图层是 div，就把组件库能力全部绕开。

## Figma 资源处理

- Figma MCP 临时资源 URL 不允许直接写入生产代码。
- 图标优先使用项目已有图标库。
- Logo 优先复用项目已有品牌资源。
- 装饰图可下载到本地 assets，或用项目已有插画替换。
- 装饰图必须 `pointer-events: none`，不参与主内容布局。

