# Kiro Power 使用说明

## 安装

在 Kiro IDE 中：

1. 打开 Powers 面板。
2. 选择 `Add power from GitHub`。
3. 输入本仓库地址。
4. 安装后确保 Power 已启用。

## 触发方式

```text
用 Figma 后台管理 UI 高保真还原 Power 处理这个页面。
```

或：

```text
我提供了 Figma MCP 原始数据，请先判断 Layout 边界和 content 区域拆分。
```

## 工作方式

Kiro 会读取 `POWER.md`，并根据任务命中情况加载 `steering/` 文件。

复杂任务建议先只执行到“开发前确认报告”，不要直接生成代码。

