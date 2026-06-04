# Codex 使用说明

## 推荐触发方式

```text
请使用 figma-ui-restore。
这是 Figma MCP 原始数据和截图，请先输出开发前确认报告。
不要直接写代码。
```

## Codex 应该做的事情

1. 读取 `SKILL.md`。
2. 按需读取 `steering/` 和 `references/`。
3. 先扫描项目上下文。
4. 判断是否已有 Layout。
5. 输出 preflight report。
6. 等用户确认后再开发。
7. 开发完成后输出自检报告。
8. 如果有 chrome-devtools MCP，尝试浏览器截图验收。

## Codex 不应该做的事情

- 不要直接照搬 Figma 的 Tailwind / React 代码。
- 不要在没有确认 Layout 的情况下生成完整后台壳。
- 不要修改全局 Layout / Table / 公共组件，除非用户明确授权。
- 不要在组件内写 `font-family`。

