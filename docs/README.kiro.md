# Kiro Power 使用说明

## 安装

在 Kiro IDE 中：

1. 打开 Powers 面板。
2. 选择 `Add power from GitHub`。
3. 输入本仓库地址。
4. 安装后确保 Power 已启用。

## 触发方式

```text
用 Figma UI 高保真还原 Power 处理这个页面。
请先判断目标平台、小程序 / H5 / Web PC 规则和页面壳边界。
```

或：

```text
我提供了 Figma MCP 原始数据，请先判断目标平台、Layout / navigationBar / tabBar 边界和 content 区域拆分。
```

## 工作方式

Kiro 会读取 `POWER.md`，并根据任务命中情况加载：

1. `steering/00-platform-router.md`
2. `steering/common/`
3. `steering/platforms/<platform>/`
4. Web PC 后台兼容读取 `steering/01-07`

复杂任务建议先只执行到“开发前确认报告”，不要直接生成代码。

## 小程序注意事项

小程序任务必须继续判断运行时方言：微信原生、uni-app、Taro React、Taro Vue 或其他。不得混写 `wx.*`、`uni.*`、`Taro.*`。复杂页面需确认资源目录、styleIsolation、原生组件层级、scroll-view、setData、开放能力和真机验收。
