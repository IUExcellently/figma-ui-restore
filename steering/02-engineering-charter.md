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

## reference.tsx className 解析

如果 Figma 提供的 `reference.tsx` 中 `className` 使用了 class 框架或原子类体系，必须先识别其语法和映射规则，再解析为对应 CSS 声明。

常见来源包括：

- Tailwind / UnoCSS 等原子类
- CSS Modules 哈希类名
- Figma 生成的自定义 class 框架
- 项目或插件导出的工具类体系

处理规则：

1. 先判断 `className` 是否有可解析的框架语法、样式映射文件或生成规律。
2. 能解析时，将 `className` 拆解为具体 CSS 声明，例如尺寸、间距、颜色、圆角、阴影、布局、状态样式。
3. 解析出的 CSS 声明必须与 `meta.json`、Figma MCP 原始数据、设计截图真实渲染结果互相校验。
4. 生成业务代码时，按目标项目样式方案输出 CSS / Less / SCSS / CSS Modules / Tailwind；除非目标项目本身使用同一套 class 框架，否则不允许原样复制 Figma 生成的 `className`。
5. 如果 `className` 解析结果与 Figma 实际色值、尺寸或布局数据冲突，以 Figma 实际渲染结果和原始数据为准。
6. 如果无法确认 class 框架含义，必须在开发前确认报告中列为风险，不得臆造映射。

## Icon 尺寸识别

Figma MCP / DesignToCodeWithFigma 导出的 icon 常见结构是：

```tsx
<div className="... size-[24px]" data-name="location">
  <div className="absolute inset-[6.25%_14.58%_4.7%_14.58%]">
    <img className="absolute block inset-0 max-w-none size-full" />
  </div>
</div>
```

识别规则：

1. 从 `img`、`svg`、`Vector` 资源节点向上查找最近的语义图标容器，优先选择带 `data-name` 且名称不是 `Vector` / `wrapper` / `Frame` 的节点。
2. 如果语义图标容器或其直接包裹层存在 `size-[Npx]`、`w-[Npx] h-[Npx]`、`width:N height:N` 等尺寸信息，优先作为 icon 的最终字号 / SVG 宽高。
3. `size-full` 表示填满当前容器，不能单独作为 icon 尺寸；需要继续向上找固定尺寸容器。
4. `absolute inset[...]` 是内部 Vector 在容器中的绘制切片，不是 icon 字号，不允许用 inset 百分比计算后缩小最终 icon。
5. 用项目图标库替换时，`font-size`、`width`、`height` 或图标组件的 `size` 属性应等于语义图标容器尺寸。
6. 如果图标容器为 `size-[24px]`，即使内部 Vector 有 `inset-[6.25%_14.58%_4.7%_14.58%]`，落地 icon 仍按 `24px` 处理。
7. 如果目标项目使用 Arco Design 图标组件，优先直接设置 Icon 组件的 `size` 属性，不额外包 DOM。

Arco Vue 示例：

```vue
<icon-calendar-clock :size="24" class="rc__bottom-icon" />
```

Arco React 示例：

```tsx
<IconCalendarClock size={24} className="rc__bottom-icon" />
```

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

## 颜色类样式规则

颜色类样式以 Figma 实际色值为最高依据。

Figma 实际色值来源包括：

- `meta.json`
- `reference.tsx`
- Figma MCP 原始数据
- 设计截图中的真实渲染色值

适用范围：

- 字体颜色
- 背景色
- 边框色
- 图标色
- 阴影色
- 渐变色
- `hover` / `active` / `selected` 状态色

颜色使用优先级：

1. 先检查项目已有变量、design token、`custom-figma-constant.less` 中是否存在相同色值。
2. 只有当变量色值与 Figma 实际色值完全一致时，才优先复用该变量。
3. 如果变量语义相近，但色值与 Figma 实际色值不一致，不允许强行复用该变量。
4. 如果没有相同色值，并且该颜色只在当前组件或当前模块内少量出现，允许直接在当前 class 中写具体色值。
5. 如果没有相同色值，但该颜色重复出现，或属于页面级核心颜色，再沉淀到 `custom-figma-constant.less`。
6. 新增变量必须使用 `@figma-` 前缀，禁止创建 `@color-*` 这种过于通用、容易和项目或 Arco 冲突的变量。
7. 禁止为了“看起来更规范”而把 Figma 实际色值替换成项目中语义相近但色值不同的变量。
8. 直接写色值时，必须写在当前 class 中，不允许使用行内 style。
9. 不允许把 Figma 节点 ID、图层名、组件名直接用于变量命名。

## 非颜色变量创建规则

字号、行高、字重、圆角、间距、断点等非颜色值仍先查已有变量；缺失且重复出现时，再写入 `custom-figma-constant.less`。

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

颜色类样式按上方颜色优先级处理；字号、行高、字重、圆角、间距、断点等非颜色值，只要重复出现两次及以上，优先抽为变量。

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
- 图标尺寸优先取 Figma 语义图标容器的 `size-[...]` / `w/h`，内部 Vector / img 的 `inset` 只作为路径绘制参考。
- 项目使用 Arco Design 时，图标尺寸映射到 Icon 组件 `size` 属性，不为 icon 额外包 DOM。
- Logo 优先复用项目已有品牌资源。
- 装饰图可下载到本地 assets，或用项目已有插画替换。
- 装饰图必须 `pointer-events: none`，不参与主内容布局。
