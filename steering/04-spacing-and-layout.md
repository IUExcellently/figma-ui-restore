# 04 · 间距、Flex 布局与文本溢出

## 组件之间的外部间距

组件之间的外部间距由父级页面或分组容器控制。

组件自身不携带外部 `margin-top` / `margin-bottom`。

### 间距一致

父容器可使用 `gap`：

```less
.page-content {
  display: flex;
  flex-direction: column;
  gap: @figma-section-gap;
}
```

### 间距不一致

优先判断是否存在业务分组。

如果存在，使用分组容器分别控制：

```less
.page-content {
  display: flex;
  flex-direction: column;
  gap: @figma-section-gap-lg;
}

.page-content__group {
  display: flex;
  flex-direction: column;
  gap: @figma-section-gap-md;
}
```

如果确实是同级模块但间距不同，用页面层 layout item class 控制，仍然不要写进子组件内部。

## 组件内部间距

组件内部不能无脑使用 `gap`。

- 同质元素等距排列：允许使用 `gap`。
- 不同语义元素非等距排列：使用语义 class + margin。
- Figma auto-layout spacing 明确：可映射为 `gap`。
- Figma 绝对定位：通过坐标计算间距。

坐标计算公式：

```text
nextY - (prevY + prevHeight)
```

计算结果要归一到项目 spacing token：

- 7 / 8 / 9 → 8
- 11 / 12 / 13 → 12
- 15 / 16 / 17 → 16
- 23 / 24 / 25 → 24

## 布局方式

默认使用：

- `flex`
- `inline-flex`
- `flex-wrap`
- `flex-basis`
- 百分比
- 媒体查询

尽量避免用 `inline-block` 做主布局。

只有规整宫格才使用 `grid`。

## 横向布局判断

必须判断谁固定、谁自适应、谁铺满剩余空间。

例如告警条：

```text
左侧时间 tag：内容自适应 + padding + 不压缩
右侧文案：铺满剩余宽度 + 超出省略 + Tooltip
```

关键样式：

```less
.warning-item__tag {
  flex: 0 0 auto;
  white-space: nowrap;
}

.warning-item__text {
  flex: 1 1 auto;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

## 文本溢出

重要业务文本若可能被截断，必须：

- `overflow: hidden`
- `text-overflow: ellipsis`
- `white-space: nowrap`
- `min-width: 0`
- Tooltip 或 `title` 展示完整内容

短状态标签和按钮文案不默认加 Tooltip。

## 装饰元素

装饰图、背景图、浮层角标不参与主内容流布局。

