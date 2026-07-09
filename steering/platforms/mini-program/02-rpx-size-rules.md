# mini-program · rpx 宽高与行高换算规则

小程序平台默认使用 `rpx` 处理明确的宽高类尺寸。本规则优先级高于 common 中的通用单位建议。

## 适用范围：严格白名单

以下属性和值使用本文件的 rpx 换算规则：

- `width`
- `height`
- `min-width`
- `max-width`
- `min-height`
- `max-height`
- `line-height`
- 图片宽高
- 图标语义容器宽高
- 卡片 / banner / 容器的明确宽高

## 不适用范围

以下属性和值不使用本文件的宽高 rpx 换算规则：

- `font-size`
- `font-weight`
- `padding`
- `margin`
- `color`
- `opacity`
- `z-index`
- 百分比
- `flex-grow` / `flex-shrink`
- `line-clamp`
- 资源路径

`font-size` 必须按项目字体规范或 Figma 字号语义处理，不因设计稿为 375px 而自动乘以 2。`font-family` 仍不得写在组件内。

## 设计稿宽度确认

写代码前必须确认 Figma 设计稿宽度，记为 `dw`。

## 换算规则

### `dw = 375px`

直接乘以 2：

```text
rpx = px * 2
```

不需要去尾，不需要二次单双数判断。

示例：

```text
100px → 200rpx
200px → 400rpx
line-height: 20px → line-height: 40rpx
```

### `dw = 750px`

直接把 px 数值改为 rpx；如果结果是单数，则 +1：

```text
base = px
final = base 为偶数 ? base : base + 1
```

示例：

```text
100px → 100rpx
101px → 102rpx
line-height: 29px → line-height: 30rpx
```

### 其他设计稿宽度

使用通用公式计算后去尾，再做单数 +1：

```text
raw = (px / dw) * 750
base = floor(raw)
final = base 为偶数 ? base : base + 1
```

示例：

```text
设计稿宽度 390px，元素宽度 172px：
raw = (172 / 390) * 750 = 330.769...
base = 330
final = 330rpx
```

```text
raw = 331.9
base = 331
final = 332rpx
```

## 禁止事项

- 禁止四舍五入。
- 禁止保留小数 rpx。
- 禁止把本规则用于 `font-size`。
- 禁止把本规则用于 `padding` / `margin`。
- 禁止把小程序 rpx 换算规则套到 H5 或 Web PC。

## 待确认项

如项目已有更严格的单位转换工具、设计 token 或 PostCSS 转换规则，应在开发前确认报告中记录，并以项目规范优先。
