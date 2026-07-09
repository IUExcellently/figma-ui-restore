# Qoder 使用说明

## 安装方式

QoderWork 可以安装包含 `SKILL.md` 的技能文件夹。建议把本仓库下载到：

```text
~/.qoderwork/skills/figma-ui-restore
```

也可以在 QoderWork 中输入：

```text
请下载 <YOUR_REPO_URL> 并把它作为 Skill 安装到 ~/.qoderwork/skills/figma-ui-restore
```

## 项目规则方式

如果你只想在某个项目中启用通用平台规则，可以复制：

```text
.qoder/rules/figma-ui-restore.md
```

到目标项目的 `.qoder/rules/` 目录。

如果目标项目只做 Web PC 后台，也可以使用兼容规则：

```text
.qoder/rules/figma-backend-admin-ui-restore.md
```

## 触发方式

```text
使用 figma-ui-restore skill，还原这个 Figma 页面。请先判断目标平台和页面壳边界。
```

小程序示例：

```text
使用 figma-ui-restore skill，还原这个微信小程序页面。请先判断运行时方言。设计稿宽度是 375px，图片目录和图标目录请先问我确认。
```

Qoder 也支持自然语言自动匹配，但建议在复杂任务里显式点名 Skill。

## 小程序建议显式补充

- 当前项目是微信原生、uni-app、Taro React 还是 Taro Vue。
- 是否已有路由、请求、图标、资源目录封装。
- 是否需要真机验收。
