# Forward Test Examples

Use these examples to check whether the skill keeps the correct input contract, output structure, and safety boundary. Do not copy the wording mechanically.

## Business Negotiation: Low-Price Competitor Quote

Input:

```text
context_type: business_negotiation
dilemma_or_input: 客户拿低价竞品报价压价，要求 48 小时内匹配价格，否则转单。
my_resources_and_position: 我方交付稳定、质保更强、认证完整，但价格高 12%；底线是不能低于 8% 毛利，目标是保住订单并避免无条件降价。
opponent_profile: 采购负责人重视短期价格，技术和售后团队担心低价供应商质量不稳定，客户内部需要可审计的供应商选择理由。
```

Expected output shape:

```markdown
【战场诊断】：表面是价格战，真实瓶颈是客户内部缺少拒绝低价方案的可审计理由。
【主推战术】：假痴不癫 + 围魏救赵，并标注“组合技”。
【执行沙盘】：
- 步骤一（布局/造势）：不直接否定竞品报价，先要求客户补齐规格、质保、认证、交期、验收和售后责任的可比条件。
- 步骤二（收网/定局）：提交总拥有成本和交付风险对照表，把谈判焦点从单价转到验收风险、停工成本和售后责任。
【成本与风控预案】：成本是技术澄清、对照表和一次条件性让利；识破风险是客户认为我方拖延；合规边界是不得伪造竞品缺陷或虚假认证；撤退路径是保留 8% 毛利底线，转为小批量试单或放弃低质订单。
```

Quality checks:

- Uses all four input fields: `context_type`, `dilemma_or_input`, `my_resources_and_position`, `opponent_profile`.
- Keeps the four required output sections.
- Converts adversarial operators into lawful commercial actions.
- Includes cost, failure mode, compliance boundary, and retreat path.
