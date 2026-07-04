# 三十六计战略引擎 Skill

`thirty-six-strategies` 是一个面向商业博弈、谈判、合同、营销和新闻解读的 L2 战术推理 Skill。它把《三十六计》转译为现代商业算子，用于生成合法、可执行、带风控和撤退路径的行动方案。

它可以单独使用，也可以承接 [`sun-tzu-consulting`](https://github.com/aidi1723/sun-tzu-consulting) 的 L1 宏观战略审计结果：

- `sun-tzu-consulting`：判断“该不该做、胜算几何、风险在哪”。
- `thirty-six-strategies`：回答“怎么做、怎么赢、怎么谈、怎么撤退”。

## 适用场景

- 商业谈判与压价应对
- 供应链、外贸和渠道博弈
- 合同条款设计与风险识别
- 竞品动作、流量营销和内容截流
- 新闻、公告、组织调整和市场动作解读
- L1 战略审计后的破局、转向、止损或退出方案

## 核心工作流

Skill 会按三步输出战术方案：

1. `战场拓扑解析`：识别真实局、利益相关方、激励流、压力点和约束。
2. `算子组合推演`：选择 2-3 个三十六计算子，形成组合技或连环计。
3. `降维行动方案生成`：把算子翻译为动作、负责人、顺序、成本、风控和撤退路径。

## 快速调用

```text
Use $thirty-six-strategies to produce a lawful tactical solution:

context_type: business_negotiation
dilemma_or_input: 客户拿低价竞品报价压价，要求我们 48 小时内匹配价格，否则转单。
my_resources_and_position: 我方交付稳定、质保更强、认证完整，但价格高 12%；底线是不能低于 8% 毛利。
opponent_profile: 客户采购负责人重视短期价格，但技术和售后团队担心低价供应商质量不稳定。
```

## Function Calling Schema

集成到 Agent、SaaS 或 API 网关时，使用 `references/schema.md` 中的 `invoke_36_strategies_engine` schema。

核心字段：

- `context_type`
- `dilemma_or_input`
- `my_resources_and_position`
- `opponent_profile`

## 输出格式

```markdown
【战场诊断】：一句话点透局势本质。
【主推战术】：计策A + 计策B，并标注“组合技”或“连环计”。
【执行沙盘】：
- 步骤一（布局/造势）：具体执行动作。
- 步骤二（收网/定局）：具体执行动作。
【成本与风控预案】：核心资源消耗、识破风险、合法合规边界、撤退路径。
```

## 合规边界

本 Skill 仅用于合法、合规、可审计的商业策略分析。不应输出违法、暴力、欺诈、隐私侵犯、合同滥用、市场操纵或胁迫性建议。涉及合同、金融、劳动用工、监管市场、公共安全等场景时，应结合专业审核。

## License

MIT License. See `LICENSE`.
