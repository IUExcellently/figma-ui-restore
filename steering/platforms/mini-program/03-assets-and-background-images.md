# mini-program · 图片、图标与背景图规则

小程序平台资源规则优先级高于 common 通用资源规则。

## 资源目录必须确认

如果页面需要落地 Figma 图片、图标、装饰图、背景图，写代码前必须确认：

- 图片资源输出目录
- 图标资源输出目录
- 是否允许新增本地资源
- 是否使用 CDN
- 是否允许放入分包
- 是否已有 iconfont / svg / image icon 方案
- Figma 临时资源替换方案

不得擅自把资源放入任意目录。Figma MCP 临时 URL 不得进入生产代码。

## 本地背景图处理

小程序本地资源不得通过 WXSS `background-image` 直接引用来复刻背景图。

如果 Figma 中某个图层语义是背景图、装饰背景、卡片背景、纹理或大块装饰图，且资源需要放在项目本地，应使用 `image` 组件或平台等价图片组件，通过绝对定位放入容器底层。

推荐结构：

```text
容器：position: relative
  背景 image：position: absolute，放底层，不参与主内容流
  内容容器：position: relative，放上层
```

背景图不得承载点击事件，不得影响主要内容布局。

## 背景类型映射

| Figma 背景类型 | 小程序实现建议 |
| --- | --- |
| 纯色背景 | `background-color` |
| 渐变背景 | 优先 CSS gradient；平台或项目不支持时转图片 |
| 本地背景图片 | `image` 组件绝对定位 |
| 远程 CDN 背景图 | 按项目规范使用 `background-image` 或 `image` |
| 装饰图 | `image` 绝对定位，不参与布局 |
| 卡片背景纹理 | `image` 绝对定位铺底 |
| 可重复纹理 | 需用户确认 CDN background / 切图 / 取消 repeat |

## image mode

用 `image` 替代背景图或落地普通图片时，必须按语义选择 `mode`：

- 类似 `background-size: cover`：`aspectFill`
- 类似 `background-size: contain`：`aspectFit`
- 按宽自适应高度：`widthFix`
- 按高自适应宽度：`heightFix`
- 明确拉伸铺满：`scaleToFill`

不得默认所有图片都使用同一个 mode。

## 图标资源

图标处理优先级：

1. 项目已有 iconfont / svg icon / 组件图标。
2. 用户指定图标资源目录。
3. Figma 导出图片图标，放入用户指定目录。

图标最终尺寸取 Figma 语义图标容器宽高，不使用内部 Vector / img 的 inset 尺寸。图片图标使用 `image` 组件时，宽高按 `02-rpx-size-rules.md` 处理。

## 资源命名

新增资源命名使用业务语义 kebab-case，不直接使用 Figma 节点 ID、临时哈希或图层自动名。

推荐：

```text
home-card-bg.png
invite-empty-illustration.png
user-avatar-placeholder.png
```

不推荐：

```text
1364-8031.png
Frame427318709.png
image-1.png
```
