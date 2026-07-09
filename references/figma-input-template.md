# Figma 输入材料模板

把 Figma MCP 原始信息整理成下面格式后，再交给 AI。

## 1. 基本信息

- 目标平台：小程序 / H5 / Web PC 后台 / 不确定
- 平台技术栈：微信原生 / uni-app / Taro / H5 / Vue / React / 其他
- Figma 文件名：
- Figma 链接：
- node-id：
- 基准画布尺寸：
- 截图文件：
- meta.json：
- reference.tsx / 参考代码：
- 多尺寸源数据目录：
- 是否包含多个业务页面：是 / 否 / 不确定
- 是否包含状态变体：无 / empty / loading / error / 不确定
- 默认有数据态节点或目录：
- 最大尺寸节点或目录：
- 520 尺寸稿是否存在：是 / 否 / 不确定
- reference.tsx className 框架或规则：Tailwind / UnoCSS / CSS Modules / 自定义原子类 / 不确定
- icon 尺寸规则备注：例如 24×24 容器 + 内部 Vector inset / 不确定

## 2. 项目技术栈

- 框架：
- UI 组件库：
- 样式方案：
- 是否允许沿用 reference.tsx 的 className 框架：是 / 否 / 不确定
- 路由方案：
- 请求封装：
- 状态管理：
- 全局 Layout 是否已存在：是 / 否 / 不确定
- 全局 Layout 是否负责 Sidebar / Menu / Header 响应式：是 / 否 / 不确定
- 768 及以下菜单策略：跟随项目 Layout / 隐藏 / 抽屉 / 顶部入口 / 完全不展示 / 待确认
- 页面适配依据：viewport / content 可用宽度 / 不确定
- 全局 Table 组件是否已存在：是 / 否 / 不确定

## 2A. 小程序补充信息

- Figma 设计稿宽度 `dw`：
- 图片资源输出目录：
- 图标资源输出目录：
- 是否使用 CDN：是 / 否 / 不确定
- 是否允许新增本地资源：是 / 否 / 不确定
- 是否允许放入分包：是 / 否 / 不确定
- 是否包含 status bar / navigationBar / 胶囊 / tabBar：
- 本地背景图是否需要用 image 绝对定位复刻：是 / 否 / 不确定

## 3. 本次希望生成范围

- 只生成 content：是 / 否
- 是否生成 Layout：是 / 否
- 是否需要移动端：是 / 否
- 是否需要接接口：是 / 否
- 是否先只生成 mock：是 / 否

## 4. 用户补充规则

- 字体 family：忽略 / 其他
- 颜色变量：复用已有 / 允许新增
- 图片资源：本地化 / 替换项目资源
- 表格：复用全局 Table / 手写
- chrome-devtools MCP：可用 / 不可用 / 不确定

## 5. 需要特别注意的地方

- 
- 
- 
