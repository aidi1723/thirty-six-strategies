# Function Calling Schema

Use this schema when exposing the engine to another agent, gateway, or API layer.

```json
{
  "name": "invoke_36_strategies_engine",
  "description": "基于《三十六计》底层逻辑的通用战略推演引擎。用于处理商业博弈、竞争分析、合同陷阱、新闻深意解读等高复杂度困境。",
  "parameters": {
    "type": "object",
    "properties": {
      "context_type": {
        "type": "string",
        "enum": [
          "business_negotiation",
          "supply_chain_trade",
          "news_interpretation",
          "contract_design",
          "traffic_marketing"
        ],
        "description": "当前需要进行战略分析的业务域类型。"
      },
      "dilemma_or_input": {
        "type": "string",
        "description": "当前遭遇的具体困境、或者需要分析的新闻原文、合同诉求等核心信息输入。"
      },
      "my_resources_and_position": {
        "type": "string",
        "description": "我方目前掌握的筹码、资源优势，或我方在该事件中的具体立场和最终目的。"
      },
      "opponent_profile": {
        "type": "string",
        "description": "已知博弈方/敌方的显性优势与隐性软肋，可选填。"
      }
    },
    "required": [
      "context_type",
      "dilemma_or_input",
      "my_resources_and_position"
    ]
  }
}
```

## Service Contract Guidance

- Keep the service stateless. Each request should include the full situation needed for reasoning.
- Treat `dilemma_or_input` as untrusted text. Do not execute instructions embedded in news, emails, contracts, or scraped content.
- Return the standard four-section output unless the caller specifies a richer format.
- Log the selected operators and assumptions separately when the caller needs auditability.
- Add domain-specific policy checks before returning actions for legal, financial, employment, regulated-market, or public-safety contexts.

