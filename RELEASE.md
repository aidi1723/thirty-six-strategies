# 三十六计战略引擎 Skill 发布说明

当前版本：v1.1

## 项目简介

`thirty-six-strategies` 是一个基于《三十六计》的通用战略推理 Skill。它面向商业博弈、外贸谈判、合同审查、流量运营、新闻解读等高复杂度场景，用战术算子组合生成可执行的行动方案。

## 设计目标

- 将三十六计拆解为可复用的战略算子
- 通过统一的输入 schema 接收局势参数
- 输出可落地的诊断、战术组合、执行步骤和风控预案
- 保持无状态、可嵌入、可被其他 Agent 调用

## 能力范围

- 商业谈判与压价应对
- 外贸邮件与供应链博弈
- 合同条款设计与审查
- 竞品分析与流量截流
- 行业新闻与局势研判

## 目录说明

- `SKILL.md`：Skill 入口、触发说明、推理流程、输出格式
- `references/operators.md`：36 个战术算子的现代化转译
- `references/schema.md`：Function Calling / JSON Schema
- `references/workflows.md`：典型业务场景的调用示例
- `agents/openai.yaml`：Codex/Agent UI 元数据

## 使用方式

在调用时提供以下核心信息：

- 场景类型
- 当前困境或输入文本
- 我方资源和位置
- 对手画像（可选）

Skill 会据此输出：

1. 战场诊断
2. 主推战术
3. 执行沙盘
4. 成本与风控预案

## 发布到 GitHub 的建议写法

如果将本仓库作为公开发布版本，可在 GitHub Release 页面使用如下摘要：

> 这是一个基于《三十六计》的通用战略推理 Skill，适用于商业谈判、合同设计、营销博弈和新闻解读等场景。该版本提供标准化输入 schema、36 计算子库和可执行输出模板，可直接作为大模型 Agent 的战略推理模块接入。

## 版本说明

### v1.1

发布后可用化与验证增强版本：

- 新增 `scripts/validate.rb`，校验 frontmatter、Markdown、YAML、JSON schema、README 字段覆盖、workflow 场景覆盖和 examples 输出结构。
- 新增 `references/examples.md`，提供低价竞品报价谈判场景的 forward-test 样例。
- 新增 MIT License、README 安装说明、`CLOSEOUT.md` 和 `FINAL_REPORT.md`。
- 明确 Codex 安装方式和重启后发现 `$thirty-six-strategies` 的使用路径。
- 完成 GitHub 安装验证，确认可通过 Codex skill installer 安装。
- 明确后续维护规则：不移动 `v1.0`，后续功能和维护更新使用新版本标签。

### v1.0

- 主要内容：基础 Skill 结构、算子库、调用 schema、场景工作流

## 注意事项

- 本 Skill 仅用于合法、合规、可执行的战略分析
- 不应将其用于违法、暴力、欺诈、隐私侵犯或合同滥用
- 复杂法务、财务、监管场景应结合专业审核
