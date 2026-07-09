# Codex 安装说明

## 方式一：作为个人 Skill 安装

```bash
mkdir -p ~/.agents/skills
git clone <YOUR_REPO_URL> ~/.agents/skills/figma-ui-restore
```

安装后在 Codex 中触发：

```text
请使用 figma-ui-restore，还原这个 Figma 页面。请先判断目标平台和页面壳 / Layout 边界。
```

## 方式二：作为项目内 Skill 使用

```bash
mkdir -p .agents/skills
git clone <YOUR_REPO_URL> .agents/skills/figma-ui-restore
```

适合团队项目共享。

## 触发提示词

```text
请使用 figma-ui-restore。
我会提供 Figma MCP 数据、截图、meta.json、reference.tsx 和项目技术栈。
先判断目标平台：小程序 / H5 / Web PC 后台，并输出开发前确认报告，不要直接写代码。
```
