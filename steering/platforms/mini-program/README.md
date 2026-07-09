# mini-program · 规则加载顺序

目标平台判断为 `mini-program` 后，按需读取本目录规则。不要机械一次性展开全部文件，但进入对应阶段时必须读取对应文件。

推荐加载顺序：

1. `00-runtime-dialect.md`：判断微信原生、uni-app、Taro React、Taro Vue 等运行时方言。
2. `01-scope-and-shell.md`：判断 status bar、navigationBar、胶囊、tabBar、safe-area 等页面壳边界。
3. `02-rpx-size-rules.md`：处理宽高 / 行高白名单 rpx 换算和 padding / margin 单位策略。
4. `03-assets-and-background-images.md`：处理资源目录、背景图、image mode、图标资源。
5. `04-components-routing-and-scroll.md`：处理组件职责、路由、原生组件层级、滚动与吸顶。
6. `05-qa.md`：处理小程序开发者工具、真机、包体、安全区等验收。
7. `06-performance-and-package.md`：处理包体、分包、CDN、setData、长列表和生命周期。
8. `07-mini-program-codegen-contract.md`：约束不同运行时的代码生成语法和 API。
9. `08-style-isolation.md`：处理 styleIsolation、externalClasses、全局样式边界。
10. `09-text-overflow.md`：处理长文本、省略、换行和真实数据风险。
11. `10-events.md`：处理事件冒泡、catchtap、业务语义事件。
12. `11-open-capabilities.md`：处理开放能力、授权、隐私、支付和安全。
