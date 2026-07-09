# Codex 使用说明

## 推荐触发方式

```text
请使用 figma-ui-restore。
这是 Figma MCP 原始数据和截图，请先判断目标平台、小程序 / H5 / Web PC 规则、页面壳 / Layout 边界，并输出开发前确认报告。
不要直接写代码。
```

## Codex 应该做的事情

1. 读取 `SKILL.md`。
2. 先读取 `steering/00-platform-router.md`。
3. 判断目标平台：小程序 / H5 / Web PC 后台。
4. 按需读取 `steering/common/` 和 `steering/platforms/<platform>/`。
5. 扫描项目上下文、运行时方言、资源目录、组件库和验收方式。
6. 输出 preflight report。
7. 等用户确认后再开发。
8. 开发完成后输出自检报告。
9. 按平台能力尝试浏览器、小程序开发者工具或其他预览验收。

## Codex 不应该做的事情

- 不要未判断平台就默认套用 Web PC 后台规则。
- 不要直接照搬 Figma 的 Tailwind / React 代码。
- 不要在没有确认页面壳 / Layout 的情况下生成完整外壳。
- 不要修改全局 Layout / Table / 公共组件 / 资源目录，除非用户明确授权。
- 不要在组件内写 `font-family`。
- 小程序中不要把本地背景图写成 WXSS `background-image`；应按规则使用 `image` 绝对定位复刻。

## 小程序任务需额外确认

- 运行时方言：微信原生 / uni-app / Taro React / Taro Vue / 其他。
- 图片目录、图标目录、是否使用 CDN / 分包。
- 是否涉及 styleIsolation / externalClasses。
- 是否涉及原生组件层级、吸顶、scroll-view、setData、长列表。
- 是否涉及开放能力、授权、分享、订阅消息、支付。
- 是否能进行小程序开发者工具和 iOS / Android 真机验收。
