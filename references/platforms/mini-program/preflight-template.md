# 小程序开发前确认报告补充模板

在目标平台为小程序时，将本模板合并到通用开发前确认报告。

## 1. 小程序平台确认

- 目标小程序平台：微信原生 / uni-app / Taro / 支付宝 / 抖音 / 其他
- 运行时方言：微信原生 / uni-app / Taro React / Taro Vue / 其他
- 方言判断依据：配置文件 / 文件扩展名 / 已有页面 / 项目依赖
- 代码形态：WXML + WXSS / Vue SFC / React + Taro / 其他
- 路由方式：wx / uni / Taro / 项目封装
- 请求封装：
- 状态管理：

## 2. 设计稿与单位

- Figma 设计稿宽度 `dw`：
- 宽高 / 行高换算规则：
  - `dw = 375`：`px * 2 = rpx`
  - `dw = 750`：`px = rpx`，单数 +1
  - 其他：`floor((px / dw) * 750)`，单数 +1
- 明确参与换算：width / height / min/max width/height / line-height / 图片宽高 / 图标容器宽高
- 明确不参与换算：font-size / font-weight / padding / margin / color / opacity / z-index / 百分比 / 资源路径

## 3. 页面壳边界

- Figma 是否包含 status bar：
- Figma 是否包含原生 navigationBar：
- 是否使用自定义 navbar：
- 是否需要避让微信胶囊：
- 是否包含 tabBar：
- tabBar 归属：全局配置 / 本次页面 / 不适用
- 是否需要 safe-area bottom：

## 4. 资源目录与背景图

- 图片资源输出目录：
- 图标资源输出目录：
- 是否使用 CDN：
- 是否允许新增本地资源：
- 是否允许放入分包：
- 背景图处理：纯色 / CSS gradient / image 绝对定位 / CDN background
- image mode 策略：aspectFill / aspectFit / widthFix / heightFix / scaleToFill

## 5. 滚动与固定区域

- 页面滚动方式：自然滚动 / 局部 scroll-view
- 是否有底部 fixed 操作区：
- 内容底部占位策略：
- 下拉刷新 / 上拉加载归属：页面层 / 组件 / 不适用

## 6. 小程序验收

- 预览方式：微信开发者工具 / uni-app / Taro / 真机 / 不可用
- 检查尺寸：320 / 375 / 390 / 414 / 430 / 项目指定
- 降级说明：

## 7. 运行时与工程风险

- 是否存在 styleIsolation / externalClasses 约定：
- 是否涉及原生组件层级与 cover-view：
- 是否涉及页面滚动监听 / 吸顶 / 滚动显隐：
- 是否涉及事件冒泡阻止：
- 是否涉及开放能力、授权、支付、分享、订阅消息：
- 是否存在 setData 高频更新风险：
- 是否存在长列表、分页、虚拟列表需求：
- 新增资源数量与包体影响：
- 是否需要 iOS / Android 真机验收：
