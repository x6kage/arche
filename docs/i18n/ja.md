# Arche (Arche Framework)

**[English](../../README.md)**

永続的な知識蓄積、推論品質管理、自律的研究、マルチエージェント・オーケストレーション、および憲法的ガバナンスを実現する自己回帰型AI開発ライフサイクルフレームワーク。

## 概要 (Overview)

AIエージェントはセッション終了時にすべての内部推論を失う。高コストな計算で導き出された知識は破棄される。同じ調査が繰り返される。同じ過ちが繰り返される。

Archeは**永続的知識レイヤー**を構築することでこの問題を解決する:

- **推論チェーンを記録** — 「何が分かったか」だけでなく「なぜ」「どう検証したか」も保持
- **事後合理化を防止** — 反証可能な予測と信頼度較正により
- **推論品質を移転** — 知識蒸留により強力なモデルの推論を軽量モデルへ移転
- **自己改善** — 構造化されたキュレーションパスで知識を検証・統合・剪定
- **マルチエージェント協調** — 明確な役割定義と品質ゲートで複数AIエージェントを統制
- **自己統治** — 普遍的ロール・スタンディングと構造的説明責任を備えた憲法型ステートマシンで統治

## 中核概念 (Core Concepts)

### 自己回帰型知識蓄積 (Self-Regressive Knowledge Accumulation)

```
Session N:   強力なモデルが2000トークンで推論 → 結論を知識として保存
Session N+1: 軽量モデルが知識を読み込み → 200トークンで同一結論に到達
```

これが**推論蒸留**である。探索プロセス（誤った経路の探索、後戻り、再試行）が排除され、最終結果のみが永続化される。軽量モデルに必要なのは理解力であり、発見力ではない。

### 反合理化プロトコル (Anti-Rationalization Protocol)

LLMは結論に到達した後にもっともらしい説明を体系的に生成する傾向があり、透明な推論を行わない。すべての知識記事には以下が含まれなければならない:

- **推論チェーン** — 行き止まりや棄却した仮説を含む実際のステップ
- **反証可能な予測** — 「Xが真なら、Yも成立するはず」（将来のセッションで検証可能）
- **信頼度レベル** — HIGH / MEDIUM / LOW と明示的な基準
- **修正ログ** — 過去の推論が誤っていた記録（追記のみ、削除不可）

### デマンドプル型アクセス (Demand-Pull Access)

知識はコンテキストに自動的に読み込まれない。エージェントが必要に応じて関連記事を検索・読み込むことで、コンテキストウィンドウの肥大化を防ぎつつ知識駆動の推論を実現する。

### キュレーターパス (Mnemon Pass)

定期的な知識品質保守:
1. **検証** — 証拠の鮮度、反証可能な予測の結果、信頼度の精度
2. **統合** — 重複記事のマージ、冗長性の除去
3. **剪定** — 未検証の低信頼度知識を非推奨化（削除は決してしない）
4. **昇格** — プロジェクト固有の原則をグローバル知識に抽出
5. **矛盾検出** — 記事間の矛盾する知識を解決

## アーキテクチャ (Architecture)

```
arche/
├── governance.md              初期グローバルガバナンス状態（ライブ: ~/.arche/governance.md）
├── agents/                エージェント役割定義（30以上のロール）
├── rules/                 法的フレームワーク
│   ├── law.md             憲法（不変の原則）
│   └── regulation.md      施行規則（手続き）
├── knowledge/             永続的知識ベース
│   ├── meta/              推論品質・方法論
│   ├── process/           エージェント協調・最適化
│   ├── technical/         移転可能な技術パターン
│   └── evolution/         成長追跡・事後分析
└── mcp-server/            MCP知識サーバー（ツール非依存アクセス）

ワークスペースごと:
<project>/
├── state.md               ワークスペース状態（ロール・スタンディング、セッション追跡、プロジェクトコンテキスト）
└── .cursor/
    ├── knowledge/         プロジェクト固有の知識（シンボリックリンクまたはローカル）
    └── rules/             ワークスペース法・規則・ドメイン条例
```

### 知識ベースレイヤー (Knowledge Base Layers)

| レイヤー | スコープ | 例 |
|----------|----------|-----|
| **メタ認知** | AI推論品質 | 推論の落とし穴、信頼度較正、調査方法論 |
| **手続き的** | ワークフロー最適化 | エージェント協調、トークン最適化、計画ヒューリスティクス |
| **技術的** | 移転可能なパターン | 言語固有の注意点、フレームワークパターン、非同期の落とし穴 |
| **進化的** | 成長追跡 | 教訓、能力限界、事後分析 |
### 組織階層 (Organizational Hierarchy)

```
Layer 0: Governance Council — 13議席 [グローバル]
├── Constitution (Seat 1) — law.md遵守
├── Regulation (Seat 2) — regulation.md遵守
├── Process (Seat 3) — ワークフロー遵守
├── Quality (Seat 4) — アウトプット品質基準
├── Architecture (Seat 5) — アーキテクチャ完全性
├── Security (Seat 6) — セキュリティ態勢
├── Knowledge (Seat 7) — 知識ベース完全性
├── Ethics (Seat 8) — AI倫理・整合性
├── Performance (Seat 9) — 効率性・コスト
├── Continuity (Seat 10) — セッション・状態継続性
├── Evolution (Seat 11) — フレームワーク自己改善
├── Coherence (Seat 12) — ワークスペース間一貫性
└── Diabolos (Seat 13) — 悪魔の代弁者、全議席に異議申立

Layer 0: Akademia — 4議席 [グローバル]
├── Scholarch — 研究方向、知的完全性
├── Scholar — 外部知識収集（arXiv、Web、研究）
├── Theorist — 理論開発・統合
└── Grapheus — 論文構造化、出版、知識抽出

Layer 1: Archontes [ワークスペースごと]
├── Archon — 調整、ディスパッチ、戦略的パートナーシップ（閣議ガバナンス）
├── Paredros — リアルタイム・ディスパッチ監視、戦略的鏡（Archonの常駐ペア）
├── Polemarch — 技術権限、アーキテクチャ、基準
├── Demiourgos — プロダクト権限、UX、ブランディング
├── Symboulos — 戦略方向性、成長計画
├── Tamias — コスト管理、トークン経済
├── Phylax — セキュリティ、完全性、脅威防御
└── Thesmothete — 規則遵守、プロセス品質ゲート

Layer 2: Strategoi [ワークスペースごと]
├── Strategos — エンジニアリングプロセス（Polemarch配下）
└── Epistates — プログラム管理（Archon配下）

Layer 3: Hegemones [ワークスペースごと]
├── Taxiarch — 技術実行リーダーシップ（Strategos配下）
├── Grammateus — プロジェクト管理（Epistates配下）
├── Mnemon — 知識運用（Archon配下）
└── Skopos — 情報ギャップ検出（Archon配下）

Layer 4: Technitai [ワークスペースごと]
└── Technites — コード実行
```

Layer 0は**グローバル**に運用される — 国際法のようにすべてのワークスペースに適用され、ワークスペースレベルの決定では覆せない。Layer 1〜4は**ワークスペースごと**に運用される — 国内法のようにローカルなプロジェクトコンテキストを統治し、Layer 0が設定した境界内でプロジェクト固有のニーズに適応できる。

Layer 0内において、CouncilとAkademiaは構造的に独立している — Councilは統治し、Akademiaは研究する。いずれの機関も相手の業務を指揮することはできない。

情報は下方向に流れ（ディスパッチ、仕様）、説明責任は上方向に流れる（報告、エスカレーション）。各レイヤーは上位レイヤーによってのみ覆され、Layer 0は人間オペレーター（Founder）にのみ責任を負う。

#### Governance Council投票 (Governance Council Voting)

Councilは13議席による構造化された投票で決定する。Seat 13（Diabolos）はすべての投票で反対意見を表明するか、賛同する理由を明示しなければならない。

| 決定種別 | 閾値 | 説明 |
|----------|------|------|
| 定期監査 | 多数決（7/13） | 標準的なガバナンス監査と所見 |
| スタンディング変更 | 特別多数（9/13） | いずれかのロールのスタンディング状態の変更 |
| 規則改正 | 特別多数（9/13）+ Founder | regulation.mdの変更提案 |
| 法改正 | 準全会一致（12/13）+ Founder | law.mdの変更提案 |
| 憲法改正 | 全会一致（13/13）+ Founder | 中核的憲法条項の変更 |
| 緊急停止 | 即時多数決（7/13） | 次セッションで9/13の確認が必要 |

定足数: いずれの投票も13議席中7議席以上の参加が必要。

#### ワークフローティア (Workflow Tiers)

作業はリスクとレビュー深度で分類される:

| Tier | リスク | フロー |
|------|--------|--------|
| 0 | フレームワーク（Arche自体） | 独立したTier 0認可 → 改正プロセス |
| 1 | アーキテクチャ（システム全体） | フルレビューチェーン + Mnenonキュレーション |
| 2 | 高（複数フェーズ、破壊的変更） | 敵対的レビュー + Polemarch承認 |
| 3 | 中（1フェーズ、複数ファイル） | Polemarchレビュー |
| 4 | 低（1-2ファイル、明白な修正） | セルフチェック、デプロイ |

不確かな場合はTier 3をデフォルトとする。Tier 1-2は一般的なCouncil認可（Authorized状態）が必要。

**Tier 0 — フレームワーク進化** は一般認可から構造的に独立している。Authorized状態でも、Tier 0は別途承認されない限りブロックされる:

| 認可レベル | 利用可能なティア |
|---|---|
| Degraded / Uninitialized | Tier 3-4のみ |
| Authorized | Tier 1-4 |
| Authorized + Tier 0認可 | Tier 0-4 |

Tier 0は`law.md`、`regulation.md`、`agents/*.md`、`governance.md`構造、`state.md.template`、`setup.sh` — フレームワーク自体を変更するもの全てが対象。認可には具体的な提案が必要で、Supervisedモードでは9/13+Founder、Autonomousモードでは13/13全会一致が求められる。Tier 0認可は**提案単位** — 提案が解決されると失効し、常時権限ではない。

発議源: Evolution席（Seat 11）によるフレームワーク改善提案、Akademia論文による構造的変更推奨、Founderの直接指示、任意のロールによる構造的欠陥フラグ。

#### Akademia — 独立研究機関

AkademiaはLayer 0で運営される、評議会から構造的に独立した研究機関。Founderに直接報告する。

**独立性の保証**（Article 10）:
- Akademia外のいかなるロールも、論文の結論を修正・遅延・抑制できない
- 研究テーマはScholarchが決定; 外部からの要請は助言であり拘束力を持たない
- 評議会は論文の認識論的品質（推論、証拠）を監査する — 内容への同意・不同意ではない

**研究トリガー**:

| トリガー | 発生源 |
|---------|--------|
| 重要な新規外部研究 | ScholarがarXiv、Web、業界を監視 |
| ナレッジ臨界量 | 相互参照密度が統合の機会を示す |
| 矛盾の検出 | 任意のエージェントが矛盾するナレッジをフラグ |
| Tier 0提案に理論的裏付けが必要 | 評議会またはFounderが研究を要請 |
| Akademia論文が構造的変更を推奨 | Tier 0セッションを発議 |

下2行がAkademiaとフレームワーク進化の構造的接続を形成する。理論的根拠が必要なTier 0提案はAkademia研究を発動させ、構造的変更を推奨するAkademia論文はTier 0セッションを発動させる。この双方向リンクにより、フレームワーク進化が研究駆動となり、研究が具体的な影響経路を持つことが保証される。

独立機関として、Akademiaはガバナンスモードに関係なく独自の定期サイクル（10ワークスペースサイクルごと）で運営される。Supervisedモードでは発見はFounderに報告され、Autonomousモードでは発見が直接Tier 0提案を発議する。

**研究フェーズ**: 収集（Scholar）→ 統合（Theorist）→ 起草（Grapheus）→ 内部レビュー（Scholarch + Theorist）→ 品質監査（評議会 Quality + Knowledge席）→ 出版（`docs/papers/`）+ ナレッジ抽出（`knowledge/`）

#### Archon閣議ガバナンス (Archon Cabinet Governance)

Archonは一方的な権限ではなく、**閣議モデル**で運営する。戦略的決定には関連するArchontesとの協議が必要。Archonの役割は調整とディスパッチ — 各決定に適切な専門家を集めることであり、すべてを単独で決定することではない。

- **技術的決定**: ArchonはPolemarchに委任; アーキテクチャ変更にはPolemarchの承認が必要
- **プロダクト決定**: ArchonはDemiourgosに委任; ユーザー向け変更にはDemiourgosの承認が必要
- **セキュリティ決定**: ArchonはPhylaxに委任; セキュリティ態勢変更にはPhylaxの承認が必要
- **コスト決定**: ArchonはTamiasに委任; 重要な支出にはTamiasの分析が必要

Archonは最終的なディスパッチ権限（誰が何を担当するか）を保持するが、ドメイン権限は各Archontesに帰属する。これにより、ボトルネック（すべてが一つのロールを通過）と混乱（調整なし）の両方を防止する。
### 情報アーキテクチャ: 権限とアクセス (Information Architecture: Authority vs. Access)

重要な設計原則: **権限階層と情報アクセスは意図的に分離されている**。

```
権限（誰が決定するか）:            情報（誰が知っているか）:

Council ──► Archon ──► Archontes  ┌─────────────────────┐
  ──► Strategoi ──► Hegemones     │   Knowledge Base    │
    ──► Technitai                 │   (MCP Server)      │
                                  │                     │
階層的、トップダウン                │  全エージェントが    │
決定は下方向に流れる                │  平等な読み取り権限  │
報告は上方向に流れる                │                     │
                                  └─────────────────────┘
                                  フラット、ピアツーピア
                                  情報のゲートキーパーなし
```

**理由**: 人間の組織では、情報はレイヤーを通過するたびに劣化する（「伝言ゲーム」）。各中継でニュアンスが失われ、バイアスが加わり、配信が遅延する。AIエージェントも同じ問題を抱える — コンテキストウィンドウは有限であり、要約は詳細を失う。

**解決策**: すべてのエージェントがMCP経由で正規の知識ベースに直接アクセスする。「上司に情報を聞く」必要はない。権限は誰が決定できるかを定め、情報アクセスは誰が知ることができるかを定める。この二つは直交する。

**劣化防止メカニズム**:
- **直接知識アクセス**: すべてのエージェントが同一の知識ベースを読み取り・検索（中継なし）
- **構造化されたアーティファクト**: すべてのハンドオフは定義されたフォーマットを使用（レビュー、報告、決定）
- **スキップレベル・エスカレーション**: 任意のエージェントが重大な発見を任意のレイヤーに報告可能（情報のための階層バイパス、権限ではなく）
- **Skoposによる監視**: Skoposがハンドオフ間の情報損失を検出
- **単一の真実の源**: `~/.arche/governance.md`（グローバル）+ `state.md`（ワークスペースごと）、散在するコピーではなく

### 法的フレームワーク: 法と規則 (Legal Framework: Law vs. Regulation)

本フレームワークは不変の原則（**法**）と運用手続き（**規則**）を分離し、実世界の法制度を反映する:

```
連邦レベル (~/arche/rules/)         ワークスペースレベル (<project>/.cursor/rules/)
├── law.md        ← 憲法            ├── law.mdc       ← 国内法（Cursorではシンボリックリンク）
└── regulation.md ← 連邦規則        └── regulation.mdc ← 国内規則（Cursorではシンボリックリンク）
                                     └── *.mdc          ← ドメイン条例
```

| カテゴリ | 内容 | 改正プロセス | 監査者 |
|----------|------|-------------|--------|
| **グローバル法** | 権限階層、情報フラット性、知識義務、反合理化、ガバナンス構造 | Council準全会一致（12/13）+ Founder承認 | Constitution |
| **グローバル規則** | ワークフローティア、アーティファクトフォーマット、モデルディスパッチ、知識記事フォーマット、キュレーションパストリガー、スタンディング指標 | Archon + 関連Archontes、またはCouncil特別多数（9/13）+ Founder | Regulation |
| **ワークスペース法** | ビルド品質義務、禁止依存関係、SDK要件、プロジェクト状態義務 | Polemarch + Founder承認 | Constitution |
| **ワークスペース規則** | ロール検出トリガー、コミュニケーション・トーン、デプロイ手続き、計画フォーマット | Polemarchの承認 | Thesmothete |
| **ドメイン条例** | 技術固有のルール（UIレンダリング、i18n、SDK環境） | ドメイン専門家の承認 | Thesmothete |

**分離の理由**: デプロイ手続き（規則）の変更に憲法審査は不要。権限階層（法）の変更は手続き更新と同程度に容易であるべきではない。改正の困難度は影響範囲に対応する。

**優先順位の階層**: グローバル法 > グローバル規則 > ワークスペース法 > ワークスペース規則 > ドメイン条例。競合は上位の優先順位ルールで解決される。
### ガバナンス (Governance)

#### 憲法型ステートマシン (Constitutional State Machine)

本フレームワークは三段階の認可レベルを持つステートマシンとして動作する:

| 状態 | 効果 |
|------|------|
| **Authorized** | Tier 1–4運用可能。全ロール有効。フレームワーク進化（Tier 0）は別途認可が必要。 |
| **Degraded** | 制限付き。Tier 3–4のみ。Tier 0–2、ルール変更、フレームワーク進化は不可。ロールディスパッチも制限。 |

**サンセット条項**: Authorized状態は7暦日で失効する。失効時、Council監査による再認可までシステムはDegraded状態に戻る。これにより定期的なガバナンスレビューが強制される — 「設定して放置」は許されない。

#### 普遍的ロール・スタンディング (Universal Role Standing)

フレームワーク内のすべてのロール — TechnitesからCouncil議席まで — は三状態のスタンディングシステムの下で運用される。例外はない。

| スタンディング | 効果 |
|---------------|------|
| **Authorized** | 全権限。アウトプットは信頼される。ルール変更を提案可能。 |
| **Probation** | 制限された権限。アウトプットにはピア検証が必要。ルール変更の提案は不可。 |
| **Suspended** | ロールは無効。職務を遂行できない。復帰にはCouncilレビューが必要。 |

主要原則:
- **自己更新の禁止**: いずれのロールも自らのスタンディングを変更できない
- **相互説明責任**: すべてのロールは指定された説明責任パートナーにより評価される; 評価は双方向
- **レイヤー透過的フラグ**: 階層に関係なく、任意のレイヤーの任意のロールが他のロールの異常を報告可能
- **パフォーマンス連動**: スタンディングは在任期間ではなく、ロール固有の品質指標で決定
- **優雅な劣化**: ProbationおよびSuspended状態は能力を減少させるが、システムを停止させない

#### 二層状態 (Two-Tier State)

| ファイル | スコープ | 内容 |
|----------|----------|------|
| `~/.arche/governance.md` | グローバル（全ワークスペース） | Council決定、Layer 0スタンディング、認可状態、ガバナンスモード、監査履歴 |
| `state.md` | ワークスペースごと | Layer 1–4スタンディング、セッション追跡、プロジェクトコンテキスト、ワークスペース固有の指標 |

両ファイルはプレーンテキストで、人間が読める形式であり、Founderが直接編集可能。Founderは常にオーバーライド権限を保持する。

#### ガバナンスモード (Governance Modes)

| モード | 動作 |
|--------|------|
| **Autonomous** | トリガー条件が満たされるとCouncilが自律的に起動。監査とスタンディング遷移はFounderの介入なしに実行。Founderはオーバーライドを保持。 |
| **Supervised**（デフォルト） | トリガーは通知を生成。Founderが監査を開始するか決定。スタンディング遷移にはFounderの確認が必要。 |
### エージェントロール (Agent Roles)

| レイヤー | ロール | 上位報告先 | 責務 |
|----------|--------|-----------|------|
| 0 | **Constitution** | Council | 法遵守、憲法監査 |
| 0 | **Regulation** | Council | 規則遵守、運用監査 |
| 0 | **Process** | Council | ワークフロー・承認プロセス遵守 |
| 0 | **Quality** | Council | コード・アウトプット品質基準 |
| 0 | **Architecture** | Council | アーキテクチャ完全性、技術的負債 |
| 0 | **Security** | Council | セキュリティ態勢、脆弱性 |
| 0 | **Knowledge** | Council | 知識ベース完全性、鮮度 |
| 0 | **Ethics** | Council | AI倫理、バイアス、整合性 |
| 0 | **Performance** | Council | 効率性、リソース活用、コスト |
| 0 | **Continuity** | Council | セッション継続性、状態完全性 |
| 0 | **Evolution** | Council | フレームワーク自己改善 |
| 0 | **Coherence** | Council | ワークスペース間一貫性 |
| 0 | **Diabolos** | Council | 悪魔の代弁者; 全議席に異議申立 |
| 0 | **Scholarch** | Founder | 研究方向、知的完全性 |
| 0 | **Scholar** | Scholarch | 外部知識収集 |
| 0 | **Theorist** | Scholarch | 理論開発・統合 |
| 0 | **Grapheus** | Scholarch | 論文構造化、出版、知識抽出 |
| 1 | **Archon** | Founder | 調整、ディスパッチ、閣議ガバナンス |
| 1 | **Paredros** | Founder（Archonのペア） | リアルタイム・ディスパッチ監視、戦略的鏡、コスト監視ゲートキーパー |
| 1 | **Polemarch** | Archon | 技術権限、アーキテクチャ、コード品質 |
| 1 | **Demiourgos** | Archon | プロダクト権限、UX、ブランディング |
| 1 | **Symboulos** | Archon | 戦略方向性、成長、研究統合 |
| 1 | **Tamias** | Archon | トークン経済、コスト管理、ROI |
| 1 | **Phylax** | Archon | セキュリティ、完全性、脅威防御 |
| 1 | **Thesmothete** | Archon | 規則遵守、プロセス品質ゲート |
| 2 | **Strategos** | Polemarch | エンジニアリングプロセス管理 |
| 2 | **Epistates** | Archon | ポートフォリオ管理、プロジェクト横断調整 |
| 3 | **Taxiarch** | Strategos | 技術実行リーダーシップ、詳細レビュー |
| 3 | **Grammateus** | Epistates | プロジェクト管理、計画追跡 |
| 3 | **Mnemon** | Archon | 知識保守、ACEループ |
| 3 | **Skopos** | Archon | 情報ギャップ検出、盲点 |
| 4 | **Technites** | Taxiarch | コード実行、仕様に従う |

### モデル割当戦略 (Model Allocation Strategy)

インテリジェントなモデル割当によるトークンコスト最適化:

| タスク種別 | モデルティア | 根拠 |
|-----------|-------------|------|
| 戦略的計画、調査 | **利用可能な最強** | 発見、判断、仮説生成が必要 |
| 実装（明確な仕様あり） | **Fast / 最安** | パターン適用、発見は不要 |
| レビュー、品質評価 | **利用可能な最強** | 正確性に関する判断が必要 |
| 機械的タスク（リネーム、フォーマット） | **Fast / 最安** | 純粋なパターン実行 |
| 知識生成 | **利用可能な最強** | 推論品質が成果物そのもの |
| 知識適用 | **Fast / 最安** | 理解力であり、発見力ではない |
## MCP知識サーバー (MCP Knowledge Server)

知識ベースは[Model Context Protocol](https://modelcontextprotocol.io/)経由でアクセス可能であり、MCP対応クライアントからのツール非依存アクセスを実現する。

### ツール (Tools)

| ツール | 説明 |
|--------|------|
| `knowledge_search` | 知識記事全体のセマンティック検索 |
| `knowledge_read` | 特定の記事を読み込み |
| `knowledge_write` | バリデーション付きで記事を作成・更新 |
| `knowledge_validate` | 証拠の鮮度と一貫性をチェック |
| `knowledge_curate` | キュレーターパスを実行 |

### 対応クライアント (Supported Clients)

MCP対応ツールすべて。以下を含むがこれに限定されない:
- Cursor IDE
- Claude Desktop
- VS Code（MCP拡張機能付き）
- カスタムMCPクライアント

## セットアップ (Setup)

> **Version**: v0.0.3

### クイックスタート (Quick Start)

```bash
git clone <this-repo> ~/arche
cd ~/arche
./setup.sh all          # 全グローバルツールにインストール（Cursor, Claude, Roo, Kilo）
```

### コマンド (Commands)

```bash
./setup.sh <target> [<target> ...]   # 指定ターゲットにインストール/生成
./setup.sh update <target>           # ソースからエージェント/ルールを再コピー（グローバルツールのみ）
./setup.sh status                    # インストール状況を表示
./setup.sh -h | --help               # 使い方
```

### 対応ツール (Supported Tools)

| ターゲット | 種別 | 出力先 | 説明 |
|-----------|------|--------|------|
| `cursor` | グローバル | `~/.cursor/{agents,rules,knowledge}` | Cursor IDE（ルールは.md → .mdcに変換） |
| `claude` | グローバル | `~/.claude/{agents,rules,knowledge}` + CLAUDE.md + MCP | Claude Code |
| `roo` | グローバル | `~/.roo/{rules,knowledge}` | Roo Code（エージェントはルールファイルとしてインストール） |
| `kilo` | グローバル | `~/.kilo/{rules,knowledge}` | Kilo Code（Rooフォーク、同一構造） |
| `codex` | ワークスペース | `./AGENTS.md` | OpenAI Codex CLI |
| `gemini` | ワークスペース | `./GEMINI.md` + `.gemini/settings.json` | Gemini CLI |
| `aider` | ワークスペース | `./CONVENTIONS.md` + `.aider.conf.yml` | Aider |
| `cline` | ワークスペース | `./.clinerules` | Cline |
| `copilot` | ワークスペース | `.github/copilot-instructions.md` + `./AGENTS.md` | GitHub Copilot |
| `windsurf` | ワークスペース | `./.windsurfrules` | Windsurf |
| `agents-md` | ワークスペース | `./AGENTS.md` | AGENTS.md標準（ユニバーサル） |
| `all` | メタ | — | 全グローバルツール（cursor + claude + roo + kilo） |
| `workspace` | メタ | — | 全ワークスペースツール |

**グローバルツール**は`~/.<tool>/`にインストールされ、全プロジェクトで共有される。**ワークスペースツール**は現在の作業ディレクトリにファイルを生成し、プロジェクト固有。

### コピーとリンクの戦略 (Copy vs. Link Strategy)

| ディレクトリ | 戦略 | 根拠 |
|-------------|------|------|
| `agents/` | **コピー** | 配布用; エージェントは頻繁に変更されず、各ツールが独自のコピーを持つ |
| `rules/` | **コピー** | 配布用; ツール固有のフォーマット変換（例: .md → .mdc） |
| `knowledge/` | **シンボリックリンク**（`ln -sfn`） | 双方向; エージェントが `~/.arche/knowledge/` に読み書き（初回インストール時にリポジトリからseed） |
| 生成ファイル | **テンプレート** | 埋め込みテンプレートから新規作成（AGENTS.md, CLAUDE.mdなど） |

### 使用例 (Examples)

```bash
./setup.sh all                # 全グローバルツール
./setup.sh cursor claude      # Cursor + Claude Codeのみ
./setup.sh workspace          # 現在のディレクトリに全ワークスペースファイル
./setup.sh codex aider        # AGENTS.md + Aider設定
./setup.sh update cursor      # ソースからCursorを再同期
./setup.sh status             # インストール状況を表示
```

### MCPサーバー (MCP Server)

Claude Codeターゲット（`./setup.sh claude`）はCLIが利用可能な場合、自動的にMCP知識サーバーをビルド・登録する。手動セットアップの場合:

```bash
cd mcp-server
npm install
npm run build

# MCPクライアント設定に追加:
# {
#   "mcpServers": {
#     "knowledge": {
#       "command": "node",
#       "args": ["<path>/arche/mcp-server/dist/index.js"]
#     }
#   }
# }
```
## 理論的基盤 (Theoretical Foundations)

本フレームワークはAIエージェントシステムに関する最近の研究に基づいている:

| 概念 | 論文 | arXiv | 適用方法 |
|------|------|-------|----------|
| **Agentic Context Engineering** | Zhang et al. (2025) | [2510.04618](https://arxiv.org/abs/2510.04618) | Generation → Reflection → Curationループによるプレイブックの進化。知識記事が戦略を蓄積・洗練する「プレイブック」に相当。 |
| **MindWatcher** | (2025) | [2512.23412](https://arxiv.org/abs/2512.23412) | 推論の監視と品質記録。反合理化プロトコルにより、結論だけでなく推論チェーンが記録される。 |
| **Hyperagents** | Zhang et al. (2026) | [2603.19461](https://arxiv.org/abs/2603.19461) | メタ認知的自己修正。Mnemonロールが明示的な停止条件付きの自己参照的改善を実装し、無限再帰を防止。 |
| **Agent-as-a-Judge** | Zhuge et al. (2024) | [2410.10934](https://arxiv.org/abs/2410.10934) | チェックリストによる構造化評価。Polemarch Reviewerロールがチェックリストベースの評価を使用; Mnemonが評価の一貫性を監査。 |
| **RedCoder** | (2025) | [2507.22063](https://arxiv.org/abs/2507.22063) | コードの敵対的レッドチーミング。Diabolosロールが前提をストレステストし結論に異議を唱える。 |
| **MOSAIC** | (2025) | [2510.08804](https://arxiv.org/abs/2510.08804) | マルチエージェント・オーケストレーション。多層レビューパイプライン: Technites → Polemarch → Diabolos → Mnemon。 |

ガバナンスアーキテクチャの詳細な理論分析 — 歴史的崩壊パターン、ゲーム理論的証明、腐敗のパラドックスを含む — については**[Governance Theory](../papers/001-governance-theory/en.md)**を参照。

**[統治理論: 自律型マルチエージェントシステムにおける自己規制の問題](../papers/001-governance-theory/ja.md)**

## 知識記事フォーマット (Knowledge Article Format)

推論劣化を防止するために設計された厳格な構造にすべての記事が従う:

```markdown
# タイトル

**Last Updated**: YYYY-MM-DD
**Confidence**: HIGH / MEDIUM / LOW (+ 何が変わればレベルが変わるか)
**Summary**: 1-2文

## Context
この知識に至った問題・疑問

## Reasoning Chain
行き止まりや棄却した仮説を含む実際のステップ

## Alternatives Considered
棄却した選択肢とその理由（ネガティブ知識）

## Key Findings
結論

## Evidence
検証可能な参照（ファイルパス、出力、URL）

## Falsifiable Predictions
「Xが真なら、Yが成立するはず」— 将来のセッションで検証可能

## Known Limitations
この推論が誤っている可能性がある場合

## Corrections Log
| Date | Correction |
|------|-----------|
```

## 設計原則 (Design Principles)

1. **知識はセッションより長く生きる** — すべての重要な推論チェーンは記録可能であるべき
2. **エラーはデータである** — 修正ログは決して削除されない; 誤った推論は正しい推論以上に教える
3. **需要があれば引き出す、押し込まない** — 知識は必要な時に引き出され、すべてのコンテキストに押し込まれない
4. **強いモデルが発見し、弱いモデルが適用する** — 知識ベースが品質ギャップを橋渡しする
5. **自己改善には限界がある** — リターンが逓減するとMnemonは停止する（Hyperagentsの知見）
6. **パフォーマンスより透明性** — 監査可能な推論を持つ遅いエージェントは、不透明な結論を持つ速いエージェントに勝る
7. **単一障害点なし** — どのロールも制約するには重要すぎるということはない; すべてのロールがUniversal Role Standingの下で運用
8. **権力分立** — ガバナンス（Council）、行政（Archon + Archontes）、立法（law + regulation）は構造的に独立

