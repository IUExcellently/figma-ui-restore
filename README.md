# figma-ui-restore

面向 Figma 高保真还原的 Power / Skill，用于把 Figma MCP 原始数据、截图、`meta.json`、`reference.tsx` 和手工规格转成可维护、可适配、可验收的前端实现。

它不是一个“把 Figma 图层直接翻译成代码”的提示词，而是一套资深前端视角的 UI 还原工作流：先判断目标平台，再判断页面壳 / Layout 边界，拆业务模块，设计数据模型，声明适配策略，最后生成可维护、可验收的代码。

## 支持平台

当前支持三个平台 Profile：

- `mini-program`：微信小程序、uni-app 小程序端、Taro 小程序端、其他小程序运行时。
- `h5`：H5、移动 Web、WebView、移动端浏览器页面。
- `web-pc-admin`：PC Web、后台管理系统、管理端页面。

Web PC 后台是当前最成熟的 Profile；小程序和 H5 通过平台规则目录提供专属约束。

## 核心原则

1. 目标平台判断先于页面类型判断。
2. 公共规则只放跨平台原则；平台规则放小程序 / H5 / Web PC 专属约束。
3. 平台规则优先级高于公共规则。
4. 页面按业务模块拆，不按 Figma 图层机械拆。
5. 页面负责接口、路由、权限、业务编排；组件负责展示、局部交互和语义化事件。
6. 组件通过语义化事件暴露行为，不暴露裸 `click` / `tap` / `dblclick`。
7. 忽略 Figma 中的字体 family，不在组件内写任何 `font-family`。
8. Figma `reference.tsx` 中框架化的 `className` 要先解析成 CSS 声明，再按目标项目样式方案实现。
9. Figma MCP 临时资源 URL 不得进入生产代码。
10. 开发前必须输出确认报告，用户确认后再写代码。
11. 开发后必须输出结构化自检报告；真实验收方式由平台规则决定。

## 小程序重点规则

- 写代码前必须确认 Figma 设计稿宽度 `dw`。
- rpx 换算只用于 width、height、min/max width/height、line-height、图片宽高、图标容器宽高、卡片 / banner / 容器明确宽高。
- `font-size`、padding、margin 不使用宽高 rpx 换算规则。
- `dw = 375`：白名单尺寸直接 `px * 2 = rpx`。
- `dw = 750`：白名单尺寸 `px = rpx`，单数 +1。
- 其他 `dw`：`floor((px / dw) * 750)`，单数 +1；禁止四舍五入和小数 rpx。
- 图片、图标、装饰图必须让用户指定资源目录。
- 小程序本地背景图不得用 WXSS `background-image` 引用，应使用 `image` 组件绝对定位复刻。
- 状态栏、胶囊、navbar、tabBar、safe-area 必须先判断归属。

## 推荐目录结构

```text
.
├── README.md
├── SKILL.md                         # Codex / Qoder 可复用的 Skill 入口
├── POWER.md                         # Kiro Power 入口
├── .codex/
│   └── INSTALL.md                    # Codex 安装说明
├── .qoder/
│   └── rules/
│       ├── figma-ui-restore.md
│       └── figma-backend-admin-ui-restore.md
├── docs/
├── steering/
│   ├── 00-platform-router.md
│   ├── common/
│   │   └── 01-cross-platform-foundation.md
│   ├── platforms/
│   │   ├── mini-program/
│   │   ├── h5/
│   │   └── web-pc-admin/
│   ├── 01-scope-and-layout.md        # Web PC 后台兼容规则
│   ├── 02-engineering-charter.md
│   ├── 03-component-and-events.md
│   ├── 04-spacing-and-layout.md
│   ├── 05-responsive-rules.md
│   ├── 06-forms-and-tables.md
│   └── 07-visual-qa.md
├── references/
│   ├── platforms/
│   │   └── mini-program/
│   │       └── preflight-template.md
│   ├── figma-input-template.md
│   ├── preflight-report-template.md
│   ├── development-checklist.md
│   ├── style-constants-template.less
│   └── chrome-devtools-qa-template.md
├── examples/
└── scripts/
```

## 快速触发

```text
请使用 figma-ui-restore。
我会提供 Figma MCP 数据、截图、meta.json、reference.tsx 和项目技术栈。
请先判断目标平台、页面壳 / Layout 边界、生成范围、组件拆分、适配策略和风险点，等我确认后再写代码。
```

## 工作流

1. 读取 Figma MCP 原始数据、截图、meta.json、reference.tsx、用户补充规则。
2. 先判断目标平台：小程序 / H5 / Web PC 后台。
3. 读取公共规则和对应平台规则。
4. 判断页面类型与页面壳 / Layout 边界。
5. 检查项目现状：技术栈、UI 框架、全局样式、变量、组件、资源目录、路由、请求封装。
6. 输出开发前确认报告。
7. 用户确认后生成代码。
8. 输出自检报告。
9. 按平台能力进行真实预览 / 截图验收；不可用时说明降级。
