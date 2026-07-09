# 00 · 目标平台路由与规则优先级

命中 `figma-ui-restore` 后，必须先读取本文件，再读取公共规则与目标平台规则。

## 目标平台先于页面类型

固定判断顺序：

1. 判断目标平台。
2. 判断该平台内的页面类型。
3. 判断该平台的页面壳 / Layout 边界。
4. 再进入组件拆分、样式映射、资源处理和验收。

不得在未判断平台时默认套用 Web PC / 后台管理规则。

## 支持的平台 Profile

| 平台 Profile | 适用场景 | 规则目录 |
| --- | --- | --- |
| `mini-program` | 微信小程序、uni-app 小程序端、Taro 小程序端、其他小程序运行时 | `steering/platforms/mini-program/` |
| `h5` | H5、移动 Web、WebView、移动端浏览器页面 | `steering/platforms/h5/` |
| `web-pc-admin` | PC Web、后台管理系统、管理端页面 | `steering/platforms/web-pc-admin/` 与现有 `steering/01-07` |

## 平台识别关键词

### 小程序

用户输入、项目文件或技术栈中出现以下信息时，优先判断为 `mini-program`：

- 小程序、微信小程序、支付宝小程序、抖音小程序
- uni-app、Taro、Remax、mpvue
- WXML、WXSS、rpx、`app.json`、`pages.json`、`mp-weixin`
- `wx.navigateTo`、`wx.switchTab`、`uni.navigateTo`、`Taro.navigateTo`

### H5 / 移动 Web

出现以下信息时，优先判断为 `h5`：

- H5、移动端 Web、mobile web、webview
- Vant、NutUI、移动端组件库
- rem、vw、viewport、safe-area、浏览器适配

### Web PC / 后台管理系统

出现以下信息时，优先判断为 `web-pc-admin`：

- 后台、管理端、PC Web、工作台、数据表格
- Sidebar、Header、Menu、Layout、Table
- Arco Design、Element Plus、Ant Design、ProTable

## 无法判断时

如果无法从用户输入、Figma 材料和项目上下文判断目标平台，必须先询问用户：

```text
本次需要还原到哪个平台：小程序、H5 / 移动 Web，还是 Web PC / 后台管理系统？
```

用户确认前，不得写代码，不得默认使用 `web-pc-admin`。

## 规则加载顺序

1. `steering/00-platform-router.md`
2. `steering/common/` 中与当前阶段相关的公共规则
3. `steering/platforms/<platform>/` 中与当前阶段相关的平台规则
4. Web PC 后台兼容读取现有 `steering/01-07` 规则

不要机械一次性展开所有文件；但进入对应阶段时必须读取对应规则。

## 规则优先级

优先级从高到低：

1. 用户当前任务中的明确要求
2. 项目已有技术栈、目录结构和代码规范
3. 当前目标平台规则：`steering/platforms/<platform>/`
4. 公共规则：`steering/common/`
5. Skill 默认偏好

当平台规则与公共规则冲突时，以平台规则为准。

公共规则不得包含具体平台假设。例如：

- common 可以要求“判断页面壳边界”，但不能默认是 Sidebar / Header。
- common 可以要求“声明响应式 / 适配策略”，但不能默认是 `1440 / 1024 / 768 / 520 / 375`。
- common 可以要求“确认单位策略”，但不能默认使用 rpx、rem 或 px。

## mini-program 规则加载顺序

目标平台判断为 `mini-program` 后，先读取 `steering/platforms/mini-program/README.md`，再按阶段读取：

1. `00-runtime-dialect.md`
2. `01-scope-and-shell.md`
3. `02-rpx-size-rules.md`
4. `03-assets-and-background-images.md`
5. `04-components-routing-and-scroll.md`
6. `05-qa.md`
7. `06-performance-and-package.md`
8. `07-mini-program-codegen-contract.md`
9. `08-style-isolation.md`
10. `09-text-overflow.md`
11. `10-events.md`
12. `11-open-capabilities.md`

新增小程序规则不得成为孤立文档；入口说明、平台路由、Qoder 规则和开发前确认模板必须能引导到这些文件。
