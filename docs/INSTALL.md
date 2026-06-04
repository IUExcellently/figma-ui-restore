# 安装与发布建议

## 推荐仓库形态

本仓库建议同时保留：

- 根目录 `SKILL.md`：Codex / Qoder Skill 入口
- 根目录 `POWER.md`：Kiro Power 入口
- `steering/`：Kiro 按需加载的工作流规则，也供 Codex / Qoder 读取
- `references/`：输入模板、自检清单、常量模板、截图验收模板
- `.codex/INSTALL.md`：Codex 快速安装说明
- `.qoder/rules/`：Qoder 项目规则兼容文件

## 发布到 GitHub

```bash
git init
git add .
git commit -m "Initial release: figma backend admin UI restore"
git branch -M main
git remote add origin <YOUR_REPO_URL>
git push -u origin main
```

## Kiro 一键安装

Kiro 用户可以在 Powers 面板中选择：

```text
Add power from GitHub
```

然后输入你的仓库地址。

## Codex 安装

把仓库 clone 到：

```text
~/.agents/skills/figma-ui-restore
```

或项目内：

```text
.agents/skills/figma-ui-restore
```

## Qoder 安装

Qoder 用户可以把仓库作为 Skill 文件夹安装，或在 QoderWork 中让它下载仓库并放到：

```text
~/.qoderwork/skills/figma-ui-restore
```

项目级规则可以复制 `.qoder/rules/figma-ui-restore.md` 到目标项目。

