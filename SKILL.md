---
name: thirty-six-strategies
description: Strategic reasoning engine based on the Thirty-Six Stratagems. Use when Codex is asked to analyze business negotiations, supply-chain trade pressure, competitor moves, traffic/content marketing, contract design, legal-commercial positioning, news interpretation, or any high-complexity commercial dilemma through Chinese strategy operators and produce executable action plans.
---

# Thirty-Six Strategies Engine

## Overview

Use this skill as a domain reasoning layer, not as a literal historical commentary tool. Translate the Thirty-Six Stratagems into modern commercial, negotiation, legal, marketing, and intelligence-analysis operators, then combine 2-3 operators into an actionable plan.

Keep outputs pragmatic. Do not propose illegal, violent, coercive, fraudulent, privacy-invasive, or contractually abusive actions. Convert adversarial language into lawful competitive moves, negotiation leverage, risk controls, positioning, and exit paths.

## Inputs

When the user provides structured data, map it to this internal schema:

- `context_type`: one of `business_negotiation`, `supply_chain_trade`, `news_interpretation`, `contract_design`, `traffic_marketing`, or a close inferred domain.
- `dilemma_or_input`: the core situation, source text, email, clause request, competitor move, or operational bottleneck.
- `my_resources_and_position`: available leverage, constraints, assets, current position, and desired end state.
- `opponent_profile`: known counterpart incentives, strengths, weaknesses, constraints, and likely reactions.

If critical input is missing, infer cautiously from the user's context. Ask a follow-up only when the missing information would change the recommended strategy materially.

See `references/schema.md` when the user needs a JSON function-calling schema or integration contract.

## Reasoning Workflow

Always follow this three-step analysis:

1. **战场拓扑解析**: Identify the core game, stakeholders, incentive flows, visible pressure, hidden constraints, asymmetries, and the real bottleneck.
2. **算子组合推演**: Select 2-3 matching stratagem operators. Build either a `组合技` with simultaneous visible/hidden lines, or a `连环计` with staged setup and capture.
3. **降维行动方案生成**: Convert the operator logic into concrete actions, owners, sequence, resource cost, risk controls, and retreat path.

Load `references/operators.md` when selecting or explaining the stratagem operators. Load `references/workflows.md` when adapting the engine to the five supported business scenarios. Load `references/examples.md` when checking output style, forward-testing behavior, or calibrating a concrete business scenario.

## Operator Selection Heuristics

- Use **胜战计** when the user already has advantage and needs to expand momentum without direct collision.
- Use **敌战计** when the situation is roughly balanced and information asymmetry or intent masking matters.
- Use **攻战计** when the situation is stuck and the user needs to draw out, isolate, or pressure a key resource.
- Use **混战计** when the field is chaotic and the best move is to reshape rules, channels, supply, or exits.
- Use **并战计** when the user is in a long consumption game and needs to take over initiative or redefine roles.
- Use **败战计** when the user is disadvantaged and needs loss control, reversal, segmentation, or a clean exit.

## Output Format

For strategic analysis, output in Chinese using this exact structure unless the user asks for another format:

```markdown
【战场诊断】：一句话点透局势本质。
【主推战术】：计策A + 计策B，并标注“组合技”或“连环计”。
【执行沙盘】：
- 步骤一（布局/造势）：具体执行动作。
- 步骤二（收网/定局）：具体执行动作。
【成本与风控预案】：核心资源消耗、识破风险、合法合规边界、撤退路径。
```

When the user asks for a deeper plan, add:

- `对手反应预测`: likely counter-moves and how to respond.
- `可执行清单`: 3-7 tasks with owner, artifact, and deadline.
- `不建议动作`: moves that are tempting but too risky, illegal, or strategically noisy.

## Quality Bar

- Make the diagnosis sharper than the user's surface description.
- Prefer controllable leverage over dramatic maneuvers.
- Name the assumed incentives behind every major move.
- Give actions that can be executed by a business, legal, marketing, sales, or analysis team.
- Include costs and failure modes. A strategy without a retreat path is incomplete.
