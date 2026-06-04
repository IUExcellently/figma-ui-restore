# figma-ui-restore

面向后台管理系统的 Figma 高保真还原 Power / Skill。

它不是一个“把 Figma 图层直接翻译成代码”的提示词，而是一套资深前端视角的 UI 还原工作流：先判断页面类型与 Layout 边界，再拆业务模块、设计数据模型、声明响应式策略，最后生成可维护、可适配、可验收的前端代码。

## 适用范围

第一版只处理后台管理系统相关页面，重点覆盖：

- 后台首页 / 工作台 / 卡片型内容页
- 内容区模块还原
- 卡片区、统计区、告警区、最近记录列表
- 筛选表单 / 简单编辑表单基础适配
- 使用项目已有 Table 组件的表格页外壳

暂不处理：

- 前台展示页
- 详情页复杂结构
- 大屏看板
- 移动端独立设计稿完整重构
- 复杂流程页 / 审批流 / 时间线

## 核心原则

1. 后台系统优先尊重项目已有 Layout，不优先尊重单张 Figma 完整画面。
2. Figma 中的侧边栏、Header、Logo、菜单很可能只是设计展示壳；除非用户确认要生成 Layout，否则只生成 content 区域。
3. 页面按业务模块拆，不按 Figma 图层机械拆。
4. 页面负责接口、路由、权限、业务编排；组件负责展示、局部交互和语义化事件。
5. 组件通过语义化 emit 暴露行为，不暴露裸 `click` / `dblclick`。
6. 忽略 Figma 中的字体 family，不在组件内写任何 `font-family`。
7. 允许创建 `custom-figma-constant.less`，但创建变量前必须先检查项目已有变量。
8. 组件之间的外部间距由父级页面或分组容器控制，组件不自带外部 margin。
9. 组件内部不能无脑使用 `gap`；`gap` 只用于同质元素等距排列。
10. 响应式不是一刀切，每个业务模块必须单独声明布局行为。
11. 如果可调用 chrome-devtools MCP，开发完成后必须进行真实浏览器截图验收。

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
│       └── figma-ui-restore.md
├── docs/
│   ├── INSTALL.md
│   ├── README.codex.md
│   ├── README.kiro.md
│   └── README.qoder.md
├── steering/
│   ├── 01-scope-and-layout.md
│   ├── 02-engineering-charter.md
│   ├── 03-component-and-events.md
│   ├── 04-spacing-and-layout.md
│   ├── 05-responsive-rules.md
│   ├── 06-forms-and-tables.md
│   └── 07-visual-qa.md
├── references/
│   ├── figma-input-template.md
│   ├── preflight-report-template.md
│   ├── development-checklist.md
│   ├── style-constants-template.less
│   └── chrome-devtools-qa-template.md
├── examples/
│   └── visitor-home-example-input.md
└── scripts/
    ├── install-codex.sh
    └── install-qoder.sh
```

## 快速触发

```text
请使用 figma-ui-restore。
我会提供 Figma MCP 原始数据、截图、meta.json、reference.tsx 和项目技术栈。
请先判断页面类型、Layout 边界、生成范围、组件拆分、响应式策略和风险点，等我确认后再写代码。
```

## 工作流

1. 读取 Figma MCP 原始数据、截图、meta.json、reference.tsx、用户补充规则。
2. 判断页面类型：只处理后台管理页面。
3. 判断 Layout 边界：已有 Layout 时只还原 content。
4. 检查项目现状：技术栈、UI 框架、全局样式、变量、Table 组件、路由、请求封装。
5. 输出开发前确认报告。
6. 用户确认后生成代码。
7. 输出自检报告。
8. 可用 chrome-devtools MCP 时进行多尺寸截图验收。

