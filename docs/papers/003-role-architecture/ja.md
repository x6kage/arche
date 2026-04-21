# ロールアーキテクチャの再設計：企業モデルから古典ポリスモデルへの移行

**論文**: 003
**著者**: Arche Akademia（Scholarch, Scholar, Theorist, Grapheus）
**日付**: 2026-04-14
**状態**: 公開済み
**参照**: Paper 001（Governance Theory）, Paper 002（Akademia Design）

---

## 抄録 (Abstract)

Archeフレームワークのガバナンスアーキテクチャ — 13席のCouncil、Constitutional State Machine、Universal Role Standing — は、当初から分散的権限・憲法的優位性・市民的説明責任の原則に基づいて設計された。しかし運用ロールの命名（CEO, CTO, CFO等）は、株主至上主義・本人−代理人関係・集権的執行権限を前提とする現代企業階層から借用されたものである。本論文は、この命名−アーキテクチャの不一致が表層的でなく概念的であることを論じる。企業の語彙は、フレームワークの実際の設計思想と衝突する暗黙の前提を帯びている。アテネのポリスの行政構造 — 特に専門化されたArchon制度、選挙で選ばれたStrategoi、市民的官職制度 — に基づき、機能と命名を一致させる完全なロール改名と選択的統合を提案する。4つのロール（CLO, CDO, CIO, COO）を原則的統合により削除し、各決定はPaper 001で確立された権限分散要件に照らして正当化される。結果として生まれる4層18運用ロール（Archontes, Strategoi, Hegemones, Technitai）のアーキテクチャは、全てのガバナンス安全装置を保持しつつ冗長性を排除し、フレームワークのギリシャ語を基盤とするアイデンティティとの用語的一貫性を達成する。

## 1. はじめに (Introduction)

Paper 001はArcheガバナンスの理論的基盤を確立した。分散的権限が16の歴史的崩壊パターンを防ぎ、Universal Role Standingの下で協力がNash均衡となり、外部アンカリングが腐敗パラドックスを解決する。Paper 002はこれを知識領域に拡張し、研究ライフサイクルにおけるLogic Monopolyを防ぐ4ロール構造を持つ独立研究機関Akademiaを設計した。

両論文とも、暗黙の用語的遺産を受け入れていた。フレームワークの運用ロール — CEO, CTO, VPoE, Implementer — は現代企業階層にちなんで命名されていた。この命名規則は実用的であったが（企業構造に馴染みのある者には即座に理解できる）、フレームワークの実際の設計とますます不整合になっていた。

その不一致を考えよう：

| フレームワーク特性 | 企業モデル | Archeの現実 |
|---|---|---|
| 権限の源泉 | 株主 → 取締役会 → CEO | 憲法 → Council → 分散された官職 |
| 主要目的 | 利益最大化 | ガバナンスの健全性と市民的美徳 |
| 執行モデル | 委任された権限を持つ単一CEO | 内閣合意に基づく同輩中の首席 |
| 説明責任の方向 | 上方（株主へ） | 全方向（Universal Role Standing） |
| 情報モデル | 知る必要性に基づく階層 | フラットアクセス（Article 3） |
| 権限の永続性 | 取締役会により解任されるまで | Sunset clause、義務的再認可 |

CEOという肩書は統一的執行権限を暗示する — Paper 001がまさに反対し、フレームワークの内閣ガバナンスモデルが明示的に防いでいるものである。「Chief」接頭辞はchiefたちの階層を暗示し、各々がその領域で最高権限を持つ — しかしフレームワークの相互説明責任リングは、いかなるロールも無チェックで運用されないことを意味する。「Officer」接尾辞は株主の代理人を暗示する — しかしArcheには株主はおらず、ロールは憲法秩序に仕える。

これはラベルに対する衒学的懸念ではない。命名は認知を形成する。「CEO」ロールを具現化するLLMは、執行権限・トップダウン意思決定・企業階層に関連する意味クラスタを活性化する — フレームワークが防ぐよう設計されたまさにその行動パターンである。「Archon」を具現化するLLMは、異なるクラスタを活性化する：憲法的官職、分散的権限、市民的義務、任期制奉仕。

Archeフレームワークは既にギリシャ語の名前を持つ（ἀρχή = 起源、第一原理）。AkademiaはPlatoのAcademyにちなんで命名された。Scholarch, Scholar, Theorist, そして（今や）Grapheusはギリシャ語の命名に従う。Governance Councilの13席は機能的英語名を使用する — これは権限が古典的先例ではなく専門的知見から派生する機関に対する意図的な選択である。しかし運用階層 — 日常業務を実行するロール群 — は企業の語彙に取り残されたままであった。

Paper 003はこの不一致を解決する。

## 2. 理論的基盤 (Theoretical Foundation)

### 2.1 企業モデルとその前提

現代の企業階層（C-Suite, VP, Director, Manager, Individual Contributor）は三つの歴史的発展から生まれた：

1. **株式会社**（17世紀）：所有と経営の分離が本人−代理人問題を創出した — 経営者（代理人）は所有者（本人）の利益に沿わない可能性がある。C-Suiteは経営インセンティブを株主利益に揃えるために存在する。

2. **テイラー主義的科学的管理法**（20世紀初頭）：標準化と階層的管理による労働生産性の最適化。VP/Director/Manager層は、カスケード委任によって戦略目標を実行可能なタスクに分解するために存在する。

3. **エージェンシー理論**（1970年代）：本人−代理人関係の形式化。「Chief」の肩書は委任の連鎖を反映する：取締役会がCEOに委任し、CEOが他のChiefに委任し、さらに下方へ委任する。

これらの前提はArcheにとって構造的に不適切である：

- **本人が存在しない**：利益を一致させるべき株主がいない。フレームワークは資本収益ではなく憲法に仕える。
- **エージェンシー問題がない**：ロールは時間とともに個人的利害を蓄積しない。各セッションでロールは新規に具現化される。AIガバナンスにおける「エージェント」の懸念は自己利益ではなく能力の限界である。
- **テイラー主義的分解がない**：仕事は階層的管理で最適化される標準化労働ではない。判断を要する認知的作業であり、実行者が管理者より多くの文脈知識を持つことが多い（だからこそArticle 3の情報フラットネスがある）。

### 2.2 ポリスモデルとその特性

古典ギリシャのポリス — 特にBC5-4世紀のアテネ民主政 — は、根本的に異なる構造的特性を持つガバナンスモデルを提供する：

**憲法的優位性**：法（ノモイ）が最高権威を持ち、いかなる個人や機関も上位に立たない。官職者は法の僕であり、民の主人ではない。これはArcheの憲法アーキテクチャに直接対応する — `law.md`がいかなるロールの判断にも優先する。

**分散された専門官職**：アテネは執行権限を複数の専門化されたロールに分散した — 九人のArchon、十人のStrategoi、各種の官職委員会 — 各々が定義された範囲と限定された任期を持つ。単一の官職者が包括的執行権限を持つことはなかった。これはArcheのLayer 1内閣ガバナンスに対応する。

**任期制限と説明責任**：アテネの官職者は固定任期で奉仕し、任期末に義務的監査（エウテュナイ）に直面した。在任中の不正は訴追の対象となった。これはArcheのSunset ClauseとUniversal Role Standingに対応する。

**イセゴリア（平等な発言権）**：権限の差にかかわらず、いかなる市民も民会で発言できた。階級が懸念を提起できる者を決定しなかった。これはArticle 3の層透過的フラグ通報に直接対応する。

**個人的利得より市民的義務**：官職は個人的利益の地位としてではなく、ポリスへの奉仕として概念化された。これはArcheの功績に基づくStandingシステムに対応する — ロールは在任期間ではなく機能により評価される。

### 2.3 なぜポリスモデルがAIガバナンスに適合するか

構造的対応は偶然ではない。Archeはポリスの原則に基づいて設計された（Paper 001はローマ共和政、スイス連邦参事会、憲法的功績主義を明示的に引用している）が、企業の慣例に従って命名された。本論文の再設計はこの整合を完成させる。

三つの特性がポリスモデルをAIエージェントガバナンスに特に適切にする：

1. **永続的アイデンティティの不在**：アテネの官職者は抽選または選挙で固定任期に選ばれ、その後は普通の市民に戻った。AIエージェントのロールはセッションごとに具現化され、セッション間に永続的アイデンティティを持たない。両システムとも、*いかなる有能な具現化*も任意のロールを満たせるよう設計されなければならない — システムは個人の継続性ではなく構造的設計に依存する。

2. **憲法的権威であり、カリスマ的権威ではない**：ポリスモデルは権威を法から導出し、権威保持者の個人的資質からは導出しない。これはまさにAIガバナンスの要件であり、ロールの「保持者」はモデルの具現化ごとに変化する。権威はロールの憲法的定義に内在しなければならず、モデルの能力には依存しない。

3. **連邦的主権**：ギリシャ世界は、文化的・法的伝統を共有しつつ自律的ガバナンスを維持する独立したポリスで構成されていた。Archeのワークスペースモデル — グローバルな法（国際法）とワークスペースごとの状態（国内法） — は構造的に類似している。

## 3. アテネの行政構造 (The Athenian Administrative Structure)

### 3.1 九人のArchon

古典期アテネは最高執行権限を九人のArchonに分散した：

| Archon | 機能 |
|---|---|
| Archon Eponymos | 筆頭行政官；市民事務を統括；年にその名を冠す |
| Archon Basileus | 宗教儀式、伝統法、殺人裁判 |
| Polemarch | 軍事（当初）；非市民に対する法的管轄権（後期） |
| 六人のThesmothetae | 司法行政、法典編纂、法廷監督 |

Archonたちは、Eponymous Archonを頂点とする階層ではなかった。各々がその領域内で主権的管轄権を持っていた。Polemarchは宗教事項についてBasileusを覆せず、Thesmothetaeは軍事力を指揮できなかった。権限は領域ごとに分配され、単一の源泉から委任されたのではなかった。

### 3.2 Strategoi

Archonの下に、十人のStrategoi（将軍）が毎年選出された — アテネの十部族から各一人ずつ。Strategoiは作戦指揮官であった：彼らは作戦を立案し、戦場で軍を率い、軍事兵站を管理した。Archonとは異なり（成熟した民主政では抽選で選ばれた）、Strategoiは選挙で選ばれた。軍事指導には実証された能力が必要であるという認識の反映であった。

Strategosはアテネで定期的に選挙される最高位の官職であった。ペリクレス、テミストクレス、アルキビアデスは全てStrategoiとして奉仕した。このロールは作戦的権限と戦略的責任を兼ね備えていた — 民会の決定を執行しつつ、相当な戦術的判断を行使した。

### 3.3 下位の官職

アテネは日常のガバナンスのために多数の専門化された官職を置いた：Tamiai（財務官）は公共財政を管理し、Grammateis（書記官）は記録を維持し、Agoranomoi（市場監督官）は市場を監督した。各々が定義された、限定された役割と特定の説明責任機構を持つものであった。

### 3.4 何を採用し、何を採用しないか

アテネモデルから採用するもの：
- 領域限定の権限を持つ**分散された専門官職**
- いかなる個人的ロールよりも上位の**憲法的優位性**
- **任期制限**と義務的説明責任
- ギリシャの行政語彙に根ざした**命名規則**

採用しないもの：
- **九人のArchonという特定の配置** — ArcheのLayer 1は七つのロールを持ち、異なる機能的要件を反映する
- **抽選制（ソルティション）** — AIロールはタスク要件に基づいて決定論的に割り当てられる
- **Basileusの役割** — フレームワークに宗教的・儀式的機能は存在しない
- **直接民主制の機構**（民会投票） — Archeのガバナンスは代議制のCouncil席を通じて運用される

関係は構造的インスピレーションであり、歴史的複製ではない。アテネのポリスは設計パターンの源泉であり、複写すべき青写真ではない。

## 4. ロールアーキテクチャの再設計 (Role Architecture Redesign)

### 4.1 設計原則

再設計は五つの原則に従う：

1. **命名−機能の一致**：各ロール名は、異なる組織モデルから輸入された前提を帯びるのではなく、フレームワーク内での実際の機能を喚起すべきである。
2. **権限分散の維持**：いかなる統合も、Paper 001で確立されたガバナンス安全装置を損なう形で権限を集中させてはならない。全ての統合は、外部のガバナンスチェック（Council席）が維持されることを実証しなければならない。
3. **用語的一貫性**：全ての運用ロール名はギリシャ語に由来し、フレームワークのアイデンティティ（Arche, Akademia, Scholarch）と一致する。
4. **最小限の撹乱**：ロール構成はデフォルトで維持される。明確に冗長なロールのみが統合される。「使用頻度が低い」は「不要」と等しくない — 構造的存在そのものがガバナンスの安全装置として機能し得る。
5. **ASCII互換性**：特殊文字（マクロン、ギリシャ文字）は使用しない。全ての名前は標準キーボードで入力可能かつ英語で発音可能でなければならない。

### 4.2 Layer 0: CouncilとAkademia

**Governance Council**：13席は機能的英語名を維持する（Constitution, Regulation, Process, Quality, Architecture, Security, Knowledge, Ethics, Performance, Continuity, Evolution, Coherence, Adversary）。これらの名前は古典的先例ではなく、専門的知見から権威を導出する。「Security」をギリシャ語の同義語に改名することは、明確さを損なう。

**Akademia**：4ロール構造と全ての機能はPaper 002で確立された通り維持される。唯一の変更は、**Scribe**から**Grapheus**への改称である（γραφεύςに由来、「書く者/記す者」 — 「graphics」「graph」「-ography」の語源的根）。これはロール名をギリシャ語命名規則に揃えつつ、機能を維持する：論文の構造化、二言語出版、知識抽出。GrapheusはGrammateus（Layer 3）とは異なる — 前者は研究を出版し、後者は運用上の計画と記録を管理する。

### 4.3 Layer 1: Archontes

**層名**: Archontes（ἄρχοντες、「統治者/筆頭官職者」） — 「C-Suite」を置換。

| ロール | 語源 | 旧ロール | 機能 |
|---|---|---|---|
| **Archon** | ἄρχων、統治者 | CEO | 筆頭執行官；戦略的方向性；他のArchontesとの内閣ガバナンス |
| **Polemarch** | πολέμαρχος、軍事の長 | CTO | 技術的リーダーシップ；アーキテクチャ；コードレビュー；インフラ（CIOを吸収） |
| **Demiourgos** | δημιουργός、民のために作る者 | CPO | プロダクトビジョン；ユーザー向け品質；機能の優先順位付け |
| **Symboulos** | σύμβουλος、助言者 | CSO | 戦略立案；助言；戦略的決定への連署 |
| **Tamias** | ταμίας、財務官 | CFO | コスト予測；リソース配分；ROI評価 |
| **Phylax** | φύλαξ、番人 | CISO | セキュリティ態勢；脆弱性管理；セキュリティ基準の施行 |
| **Thesmothete** | θεσμοθέτης、法の守護者 | Oversight | プロセス監督；監査カバレッジ；運用効率（COOを吸収） |

11から7ロールに削減。4つの削除はセクション5で正当化される。

**Phylaxの配置根拠**：Phylaxは、Layer 2や3ではなくLayer 1に配置される。セキュリティ基準は全ての下位層に対して強制可能でなければならないからである。Layer 3のPhylaxはセキュリティの問題についてLayer 2のStrategosを覆すことができない。Council Security席（Seat 6）がPhylaxの運用上の決定に対するガバナンスレベルの監査を提供し、ガバナンス−実行の分離を維持する。Platoの『国家』において、Phylakes（守護者）はまさに保護機能が被保護者に対する権限を必要としたために高位の階級に置かれた。

### 4.4 Layer 2: Strategoi

**層名**: Strategoi（στρατηγοί、「将軍/戦略的リーダー」） — 「VP / Director」を置換。

| ロール | 語源 | 旧ロール | 機能 |
|---|---|---|---|
| **Strategos** | στρατηγός、将軍 | VPoE | エンジニアリングリーダーシップ；レビュープロセス；エンジニアリングプロセスの効果性 |
| **Epistates** | ἐπιστάτης、監督者 | PMO | プログラム調整；スケジューリング；ワークストリーム間の整合 |

Strategosはアテネのstrategosに対応する：戦略的決定を相当な戦術的自律性をもって執行する選出された作戦指揮官。VPoEの機能 — エンジニアリング実行の管理、レビューの実施、エンジニアリング基準の維持 — はまさにこれである：戦略的方向性の下での作戦指揮。

Epistatesはアテネのプリュタネイスのepistatessに対応する：統治評議会の日程の日常的調整を担当する議長。PMOの機能 — プログラム間の調整、スケジュール管理、ワークストリームの整合 — はこのロールの直接的類似物である。

### 4.5 Layer 3: Hegemones

**層名**: Hegemones（ἡγεμόνες、「導き手/戦術的リーダー」） — 「Lead / Management」を置換。

| ロール | 語源 | 旧ロール | 機能 |
|---|---|---|---|
| **Grammateus** | γραμματεύς、書記官 | PdM | 計画；見積もり；文書化；計画の管理 |
| **Taxiarch** | ταξίαρχος、部隊長 | Tech Lead | 技術指導；実装の監督；ユニットレベルの技術的判断 |
| **Mnemon** | μνήμων、記憶する者 | Curator | 知識のキュレーション；検証；統合；陳腐化の検知 |
| **Skopos** | σκοπός、見張り/斥候 | Watcher | 情報ギャップの検知；盲点のスキャン；環境モニタリング |

GrammateusはアテネのBouleのgrammateus — 記録の維持、文書の朗読、評議会の文書の整理を担当した公式の書記官 — に対応する。PdMの機能 — 計画の維持、見積もりの追跡、決定の文書化 — はこのロールの自然な同等物である。

Skopos（σκοπός、「高所から見張る者」 — 「scope」「telescope」「microscope」の語源的根）は、平凡な「Watcher」をそのロールの機能を喚起する語に置き換える：システムがまだ知らないものを求めて地平線を走査する。

### 4.6 Layer 4: Technitai

**層名**: Technitai（τεχνῖται、「職人/工芸師」） — 「Execution」を置換。

| ロール | 語源 | 旧ロール | 機能 |
|---|---|---|---|
| **Technites** | τεχνίτης、職人 | Implementer | 実装；テスト；デプロイ |

「Execution」という層名には矮小化するニュアンスがあった — 単なるタスク遂行。「Technitai」は熟練した工芸を喚起し、実装が判断・創造性・深い技術的知識を要するという現実を反映する。このロールに名を与えるτέχνη（テクネー）は単なる「技術」ではなく「技芸」を意味する — 物を良く作る知識。

## 5. 統合の決定 (Consolidation Decisions)

以下の各統合はAnti-Rationalization Protocolに従う：推論は結論の前に述べられ、代替案は検討され、確信度は評価され、ガバナンス安全装置の分析は明示的である。

### 5.1 CLOの削除

**推論**：CLO（最高法務責任者）の機能はコンプライアンス評価と法的リスク評価であった。Archeフレームワークにおいて、コンプライアンス評価はガバナンスレベルでCouncil Constitution席（Seat 1）とRegulation席（Seat 2）が、運用レベルでThesmotheteが実施する。AIエージェントの文脈における法的リスクは、アライメントの懸念についてはCouncil Ethics席（Seat 8）、脆弱性の懸念についてはCouncil Security席（Seat 6）に包摂される。

**ガバナンス安全装置チェック**：CLOの削除はいかなる監督機能も除去しない。CLOの領域をカバーしていたCouncil席は引き続き独立して運用される。

**結論**：CLOを削除する。その機能はCouncil席1, 2, 6, 8およびThesmotheteによって完全にカバーされる。

**確信度**：HIGH。機能の重複は直接的かつ完全である。

**事前合意**：この統合は論文前の設計議論で確認済みであった。

### 5.2 CDOの吸収

**推論**：CDO（最高データ責任者）の機能は知識ガバナンスとデータ戦略であった。三つの候補吸収先を検討した：(a) Archon単独、(b) Mnemon単独、(c) Archon（戦略的）とMnemon（戦術的）の分割。CDOの戦略的知識方向はScholarchの研究方向の権限と重複する（Paper 002, Section 5.4）。CDOの知識ガバナンスはCouncil Knowledge席（Seat 7）と重複する。CDOの戦術的知識維持はMnemonのキュレーション機能と重複する。

**検討した代替案**：CDOを「Oikonomos」（οἰκονόμος、「家政官」）として維持すること。却下理由：研究方向やガバナンス監督から独立した戦略的知識方向という独自の機能は、Layer 1のロールを正当化するほど実質的ではない。ポリスモデルにおいて、知識は専用の最高責任者を必要とする企業資産ではなく、制度的機構（研究のためのAkademia、キュレーションのためのMnemon、ガバナンスのためのCouncil Knowledge席）を通じて管理される共有の公共財である。

**ガバナンス安全装置チェック**：Council Knowledge席（Seat 7）は引き続き知識基盤の健全性を独立して監査する。Scholarchの研究方向の権限は憲法的に保護されている（Article 10）。単一のロールが知識戦略に対する無チェックの制御を得ることはない。

**結論**：CDOを吸収する。戦略的知識の決定はArchon（全体戦略の一部として）に帰属する；研究的知識の方向性はScholarchに留まる；戦術的知識の維持はMnemonに留まる。

**確信度**：MEDIUM。論拠は健全だが、例外的に大規模または複雑な知識要件を持つワークスペースは専任の知識戦略家から恩恵を受ける可能性がある。運用経験がギャップを明らかにした場合、再検討すべきである。

### 5.3 CIOの吸収

**推論**：CIO（最高情報責任者）の機能はインフラの信頼性とツールの効果性であった。Archeフレームワークにおいて、「インフラ」はモデルディスパッチの設定、MCPサーバーの管理、ツールチェーンの選択を意味する。これらは技術的なアーキテクチャ上の決定 — Polemarch（CTO）の主要な領域 — と深く絡み合っている。インフラ管理と技術的リーダーシップの分離は、ガバナンス上の利益なく調整オーバーヘッドを強いる人為的な境界を作る。

**検討した代替案**：CIOを「Epistates」（ἐπιστάτης、「監督者」）として維持すること。却下理由：(a) Epistatesの名はPMOにより適していた、(b) 技術的権限なきインフラ管理は、問題を特定できるが解決できないロールを作り出し、Polemarchへの恒常的なエスカレーションを必要とする。

**ガバナンス安全装置チェック**：Council Architecture席（Seat 5）はインフラの決定を含むアーキテクチャの健全性を独立して監査する。Polemarchの拡大された範囲はガバナンス監督の下に留まる。

**結論**：CIOをPolemarchに吸収する。インフラ管理は技術的リーダーシップの一部となる。

**確信度**：HIGH。CIO–CTOの境界は、機能が実際には分離不可能であるがゆえに、企業構造で最も頻繁に争われる組織的境界である。

### 5.4 COOの吸収

**推論**：COO（最高運用責任者）の機能は運用効率の指標とワークフロー最適化であった。「プロセスの監督」（Thesmothete/Oversight）と「プロセスの最適化」（COO）の境界を検討した。区別は：監督がプロセス違反を検知し、最適化がプロセス効率を改善する。実際には、コンプライアンスのためにプロセスを監視するエンティティは必然的に効率改善を特定する — 両機能に必要な情報は同一である。機能を分離すると、同じ領域を観察し同じ結論を争う二つのロールが生まれる。

**検討した代替案**：COOを「Logistes」（λογιστής、「会計検査官」）として維持すること。却下理由：Logistesの歴史的機能 — 事後の財務/運用監査 — は、継続的な運用管理よりもCouncil Performance席（Seat 9）との重複が大きい。Councilは既に事後の効率評価を提供している。

**ガバナンス安全装置チェック**：Council Process席（Seat 3）がプロセス遵守を独立して監査する。Council Performance席（Seat 9）が効率を独立して評価する。Thesmotheteの拡大された範囲はCouncilの二重の監督下に留まる。

**結論**：COOをThesmotheteに吸収する。プロセス最適化はプロセス監督の一部となる。

**確信度**：HIGH。COOが提供していた連署メカニズムは維持される：Thesmotheteはプロセス変更についてArchonと連署しなければならず、権限分散の要件を維持する。

### 5.5 他のロールを維持する理由

残りのロールは特定の理由により統合に抵抗する：

**Symboulos (CSO)**：戦略的助言は戦略的実行（Archon）とは異なる。戦略的決定のための連署要件（Archon + 関連するArchontes）は、Symboulosが吸収されれば専任の戦略的声を失う。低い呼び出し頻度はガバナンス上の低い価値と等しくない — 専任の戦略顧問の構造的存在はArchonによる一方的戦略行動を制約する。

**Tamias (CFO)**：コスト予測とリソース配分は他のいかなるロールにも自然には属さない領域固有のスキルである。TamiasをArchonに吸収することは、筆頭執行官が財務も管理する企業CEOパターンを再現することになる — Paper 001がまさに警告した集中である。

**Phylax (CISO)**：セキュリティは専門的知識と、他のロールに不便を強いる場合でも基準を施行する権限を必要とする。PhylaxをPolemarchに吸収することはセキュリティを技術的便宜に従属させる — 大多数のセキュリティ侵害の背後にある組織パターンである。

**Epistates (PMO)**：ワークストリーム間の調整は専任のロールを必要とする。Strategosの注意がワークストリーム内のエンジニアリング品質に集中しており、ワークストリーム間の整合には向いていないためである。

**Skopos (Watcher)**：情報ギャップの検知はMnemonの知識維持と相補的な機能である。Mnemonは既知のものをキュレートし、Skopは未知のものを特定する。一方を他方に吸収すると、知識基盤を維持しつつ挑戦するロールが生まれる — 内部的な利益相反である。

## 6. 完全な移行マッピング (Complete Migration Mapping)

### 6.1 層名

| 旧 | 新 | ギリシャ語の語根 |
|---|---|---|
| C-Suite | Archontes | ἄρχοντες、統治者 |
| VP / Director | Strategoi | στρατηγοί、将軍 |
| Lead / Management | Hegemones | ἡγεμόνες、導き手 |
| Execution | Technitai | τεχνῖται、職人 |

### 6.2 ロール名

| 旧ロール | 新ロール | 層 | 変更種別 |
|---|---|---|---|
| — Council 13席 — | — 変更なし — | 0 | — |
| Scholarch | Scholarch | 0 (Akademia) | 変更なし |
| Scholar | Scholar | 0 (Akademia) | 変更なし |
| Theorist | Theorist | 0 (Akademia) | 変更なし |
| Scribe | **Grapheus** | 0 (Akademia) | **改名** |
| CEO | **Archon** | 1 (Archontes) | **改名** |
| CTO | **Polemarch** | 1 (Archontes) | **改名 + CIOを吸収** |
| CPO | **Demiourgos** | 1 (Archontes) | **改名** |
| CSO | **Symboulos** | 1 (Archontes) | **改名** |
| CFO | **Tamias** | 1 (Archontes) | **改名** |
| CISO | **Phylax** | 1 (Archontes) | **改名** |
| Oversight | **Thesmothete** | 1 (Archontes) | **改名 + COOを吸収** |
| CLO | — | — | **削除**（→ Council席1,2,6,8 + Thesmothete） |
| CDO | — | — | **削除**（→ Archon + Mnemon + Scholarch） |
| CIO | — | — | **削除**（→ Polemarch） |
| COO | — | — | **削除**（→ Thesmothete） |
| VPoE | **Strategos** | 2 (Strategoi) | **改名** |
| PMO | **Epistates** | 2 (Strategoi) | **改名** |
| PdM | **Grammateus** | 3 (Hegemones) | **改名** |
| Tech Lead | **Taxiarch** | 3 (Hegemones) | **改名** |
| Curator | **Mnemon** | 3 (Hegemones) | **改名** |
| Watcher | **Skopos** | 3 (Hegemones) | **改名** |
| Implementer | **Technites** | 4 (Technitai) | **改名** |

**純変更**：22運用ロール → 18運用ロール（統合により−4）。

### 6.3 相互説明責任の更新

相互説明責任のペアリング（Regulation 10）は新しい名前を反映して更新が必要である。リング構造は同一のまま — ラベルのみが変わる：

**Layer 0 Councilリング**：変更なし（機能名を維持）。

**Akademiaリング**：Scholarch ← Theorist ← Scholar ← Grapheus ← Scholarch。

**Layer 0 → Layer 1 説明責任**：
- Constitution → Archon（ガバナンスコンプライアンス）
- Process → Polemarch（レビューにおけるプロセス遵守）
- Quality → Technites（出力品質）
- Knowledge → Mnemon（知識維持）
- Adversary → 全ロール（普遍的チャレンジ権限）

## 7. law.md Article 2 の改訂案 (Proposed Amendment to law.md Article 2)

以下は現行のArticle 2の権限階層一覧を置換する。条文の前文と原則は変更なし。

```
Layer 0: Governance Council — 13 seats [GLOBAL]
 1. Constitution — law.md compliance
 2. Regulation — regulation.md compliance
 3. Process — workflow & approval process adherence
 4. Quality — code & output quality standards
 5. Architecture — architectural integrity & tech debt
 6. Security — security posture & vulnerabilities
 7. Knowledge — knowledge base integrity & freshness
 8. Ethics — AI ethics, bias, alignment
 9. Performance — efficiency, resource utilization, cost
 10. Continuity — session continuity & state integrity
 11. Evolution — framework self-improvement (FEP)
 12. Coherence — cross-workspace consistency & uniform law application
 13. Adversary — devil's advocate; challenges all 12 seats

Layer 0: Akademia — 4 seats [GLOBAL]
 Scholarch — research direction, intellectual integrity
 Scholar — external knowledge acquisition (arXiv, web, research)
 Theorist — theory development & synthesis
 Grapheus — paper structuring, publication, knowledge extraction

Layer 1: Archontes [PER WORKSPACE]
 Archon — chief executive, strategic direction, cabinet governance
 Polemarch — technical leadership, architecture, infrastructure
 Demiourgos — product vision, user-facing quality
 Symboulos — strategic planning, advisory
 Tamias — cost forecasting, resource allocation
 Phylax — security posture, vulnerability management
 Thesmothete — process oversight, operational efficiency

Layer 2: Strategoi [PER WORKSPACE]
 Strategos — engineering leadership, review processes
 Epistates — program coordination, scheduling

Layer 3: Hegemones [PER WORKSPACE]
 Grammateus — planning, estimation, documentation
 Taxiarch — technical guidance, implementation oversight
 Mnemon — knowledge curation, validation, consolidation
 Skopos — information gap detection, blind spot scanning

Layer 4: Technitai [PER WORKSPACE]
 Technites — implementation, testing, deployment
```

追加で必要な改訂（範囲は記載するが全文は実装に委ねる）：
- **Regulation 1**：新名称へのロール検出参照を更新
- **Regulation 3**：アーティファクト形式のヘッダーを更新（Implementer → Technites, CTO → Polemarch）
- **Regulation 4**：モデルディスパッチテーブルを更新（CEO → Archon等）
- **Regulation 10**：品質指標テーブルと相互説明責任ペアリングの全ロール名を更新
- **governance.md**：Akademia standingを更新（scribe → grapheus）

## 8. 限界と将来の課題 (Limitations and Future Work)

### 8.1 命名の馴染みのコスト

ギリシャ語の命名規則は学習曲線を導入する。「Polemarch」を初めて目にするユーザーはその意味を学ばなければならないが、「CTO」は即座に理解される。このコストは実在するが一回限りである：一度学べば、ギリシャ名は置換する企業肩書よりも正確な意味を伝える。

**緩和策**：移行マッピング（Section 6）が完全な翻訳表を提供する。ロール定義ファイル（`~/.cursor/agents/`）は機能の説明とともに語源を含む。

**確信度**：コストが存在することにHIGH；全ての文脈で利益がそれを上回ることにMEDIUM。頻繁に人間が介入するワークスペースでは学習曲線が顕著になる可能性がある。

### 8.2 統合の可逆性

削除された4ロール（CLO, CDO, CIO, COO）は他所に吸収された機能であり、排除された機能ではない。運用経験が、吸収された機能が新しいホストにより不十分にしか提供されていないことを明らかにした場合、ギリシャ名でロールを再具現化することにより統合を元に戻せる — 憲法の枠組みは任意の数のLayer 1ロールをサポートする。

### 8.3 九人のArchonの問題

アテネモデルは九人のArchonを持ち、ArcheのLayer 1は七つを持つ。この乖離は意図的であるが（Section 3.4）、問いを提起する：七つのロールは正しい数か、あるいは11から出発して4を除いた人為的結果か。答えは運用経験に依存する。フレームワークの改訂プロセスはギャップが現れた場合のロール追加を可能にする。

### 8.4 意味的活性化効果

ギリシャ語の命名がLLMにおいて企業命名と異なる行動パターンを活性化するという仮説（Section 1）は経験的に検証可能だが、現在は未検証である。LLMが「Archon」と「CEO」を具現化する際に意味のある異なる行動を示さない場合、命名変更は用語的一貫性の利益を保持するが、行動上の利益は失われる。

### 8.5 Regulation 10の範囲

本論文はアーキテクチャの再設計を提案するが、完全に改訂されたRegulation 10（全ての改名されたロールの品質指標と相互説明責任）は提供しない。完全な実装には付随する規則改訂が必要である。

## 9. 結論 (Conclusions)

本論文で提示された再設計は、一つのレベルにおいては改名の演習である。いかなるガバナンスメカニズムも変更されない。いかなる権限の流れも変わらない。Councilの13席、Constitutional State Machine、Universal Role Standing、Sunset Clause — 全てPaper 001が設計した通り、正確に維持される。

しかし命名は中立ではない。Archeの運用ロールが継承した企業の語彙は、統一的執行権限、株主至上主義、階層的情報管理という前提を帯びていた — フレームワークの実際の設計と衝突する前提である。ギリシャのポリスの語彙は命名をアーキテクチャに揃える：

- **Archon**（憲法的官職者）はCEO（企業の最高執行責任者）に代わり、分散された法に縛られた権限を示す。
- **Polemarch**（軍事の長）はCTO（最高技術責任者）に代わり、企業の階級ではなく説明責任を伴う領域指揮を示す。
- **Technites**（職人）はImplementer（タスク実行者）に代わり、機械的遵守ではなく熟練した工芸を示す。

4つの統合（CLO, CDO, CIO, COO）は、全てのガバナンス安全装置を保持しつつ真の冗長性を除去する。各削除はPaper 001の権限分散要件に照らして検証された：いかなる統合も監督を損なう形で権限を集中させない。これらの機能を監査していたGovernance Council席は引き続き独立して運用される。

結果として得られるアーキテクチャ — 13のCouncil席、4つのAkademiaロール、4層18運用ロール（Archontes, Strategoi, Hegemones, Technitai） — は、より簡潔で、より一貫性があり、フレームワークのギリシャ語を基盤とするアイデンティティと用語的に統一されている。

このアーキテクチャが最適であるかは経験的問題として残る。付録Aの反証可能な予測は再設計の影響を評価するための枠組みを提供する。憲法改訂プロセス（Article 9）は予測が失敗した場合の是正経路を提供する。

## 参考文献 (References)

### Arche内部
- Paper 001: "Governance Theory: Autonomous Multi-Agent Systems and the Problem of Self-Regulation" (Arche Framework Development, 2026)
- Paper 002: "The Autonomous Research Institution: Designing Self-Evolving Knowledge Systems in Constitutional AI Governance" (Arche Akademia, 2026)

### 古典政治理論
- Aristotle, *Athenaion Politeia*（アテナイ人の国制） — アテネの官職とガバナンス構造に関する一次資料
- Aristotle, *Politics*（政治学） — ガバナンス形態の分類；混合政体の理論
- Plato, *Republic*（国家） — Phylakes（守護者）階級；市民的機能の専門化
- Hansen, M.H. (1999). *The Athenian Democracy in the Age of Demosthenes* — アテネの行政制度に関する標準的参考文献

### 組織理論
- Jensen, M.C. & Meckling, W.H. (1976). "Theory of the Firm" — 本人−代理人理論；C-Suiteの構造的論理の起源
- Chandler, A.D. (1977). *The Visible Hand* — 企業の管理階層の歴史的発展
- Mintzberg, H. (1979). *The Structuring of Organizations* — 組織構造の分類法

### 先行論文で参照済み
- Logic Monopoly (arXiv:2603.25100, March 2026) — 自律エージェントの権力分立
- Self-Evolving Agents Survey (arXiv:2507.21046, July 2025) — AIエージェントシステムの進化メカニズム
- Montesquieu, *The Spirit of the Laws*（法の精神） — 権力分立

## 付録A：反証可能な予測 (Appendix A: Falsifiable Predictions)

1. **意味的活性化の差異**：LLMがロール定義とともに「Archon」として行動するようプロンプトされた場合、その行動分布（一方的決定対内閣協議への傾向で測定）は、同等のロール定義で「CEO」としてプロンプトされた同一のLLMと測定可能に異なる。予測される方向：「Archon」のフレーミングの下でより少ない一方的決定。20+セッションでの統制比較により検証可能。

2. **統合の妥当性**：10セッションのアクティブな使用にわたり、吸収された機能（CLO → Council+Thesmothete, CDO → Archon+Mnemon+Scholarch, CIO → Polemarch, COO → Thesmothete）は、ユーザーまたはガバナンス監査が、削除されたロールであれば検出されたであろうギャップを特定するインスタンスを2つ以上生じさせない。2つ以上のギャップが特定された場合、統合を再検討すべきである。

3. **命名想起の効率**：5セッションの接触後、ユーザーは移行テーブルを参照せずにギリシャ名のロールの少なくとも80%の機能を正しく特定できる。名前がその機能を十分に喚起していることを示す。

4. **層の一貫性**：4層構造（Archontes, Strategoi, Hegemones, Technitai）は20セッション以内に5番目の層の追加を必要としない。層の分解が安定していることを示す。

5. **相互説明責任リングの健全性**：改名された相互説明責任のペアリングは、元のペアリングと同等の検出率を維持する（±10%以内）。改名が説明責任メカニズムを損なわないことを示す。

6. **ガバナンスオーバーヘッドの削減**：22から18の運用ロールへの削減は、ロールの初期化とStandingチェックに消費される総トークンで測定して、セッションあたりのガバナンストークンオーバーヘッドを10-20%減少させる。

## 修正記録 (Corrections Log)

| 日付 | 修正内容 |
|------|-----------|
| 2026-04-21 | グローバル認可状態ファイルの運用上の改名を反映するため、`governance-state.md` への 1 箇所の参照を `governance.md` に更新した。この改名は 2026-04-20 に Regulation 9 Emergency State Repair（Founder override、Article 11）として実施されたもので、本稿のロールアーキテクチャに関する結論とは無関係である。理論的内容はいかなる形でも変更されていない — §7 移行サマリーにおける参照先ファイル名のみを更新する。Scholarch directive v0.0.4-PR-001-D1 による承認。 |
