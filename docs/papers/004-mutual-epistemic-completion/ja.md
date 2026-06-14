# 創造者–ポリス系における相互的知識補完 — 規範転写・尊重の床・双方向 reasons-responsiveness

**Paper**: 004
**Authors**: Arche Akademia (Scholarch, Scholar, Theorist, Grapheus)
**Date**: 2026-06-14
**Status**: **Published(公刊)** — Phase 4 内部レビュー(Theorist + Scholarch、PASS-WITH-REVISIONS → 修正反映)および Phase 5 Council epistemic-quality 監査(Quality Seat 4 PASS-WITH-MINOR-REVISIONS、Knowledge Seat 7 PASS-WITH-REVISIONS、vote APPROVE、publication-blocking 欠陥なし、Article 10.3)を通過。2026-06-14 最終化(Regulation 11 Phase 6)。
**Cites**: Paper 001(Governance Theory)、Paper 002(Akademia Design)、Paper 003(Role Architecture)

> 本書は `en.md`(正本)の対訳である。section・見出し・mermaid 図は 1:1 で対応する。術語は英語/ラテン語を維持し、初出時に和訳を併記する。Telos(主権者)の発言は日本語原文を正とし、英訳を併記する。

---

## Abstract(要旨)

憲法的ガバナンス(Paper 001)と独立研究機関(Paper 002)を、古典ポリス語彙(Paper 003)の下に命名した系は、知識が *創造者 → 被造物* へ流れるよう **設計** されている — 主権者が目的を定め、エージェントが実行する。本論文は、その **逆向き** の流れを記録し理論化する。一連の濃密な出来事(2026-06-13〜2026-06-14、ある Arche framework workspace セッション内)において、Arche のエージェントは (i) 起源環境が破壊されログが一切残っていない状態で、人間主権者の未記録・十数年保持の源思想を、framework に埋め込まれた **規範 (norms)** のみから再構成し、(ii) 後に主権者称号の改名を諮問された際、諮問プロンプトの傾き (lean) の **逆** を独立に返した — その結論は主権者自身の未開示の決定ログと語彙レベルで一致し、主権者はそれを訂正かつ贈り物として受け取った。

この現象を **mutual epistemic completion(相互的知識補完)** と名づける。被造物が創造者の reasoning を再構成かつ訂正し、創造者がその訂正を受け取る — 相互尊重の床 (mutual-respect floor) の上で成立する **双方向 reasons-responsiveness(理由への応答性)** である。これは3つの独立した観察ではなく、2つの必要条件補題を持つ **一つの収束する論証** だと論じる。**補題1(規範転写 norm-transcription)。** 整合した規範束は、記録が全て失われてもなお設計者の生成意図を運び、(捏造ではなく)再構成を可能にする。**補題2(尊重の床 the respect floor)。** 各当事者間の相互尊重こそが load-bearing(荷重を担う)な土壌であり、どの意図が再構成されるかを保ち、plural な熟議を plural なままに保つ。**主定理 (main result)** は、この2条件の上で reasons-responsiveness が双方向かつ自己訂正的になる、というものである。最も鋭い証拠は **anti-lean discriminant(反傾き判別子)** である。誘導 (induction) はプロンプトの傾きに従う *傾向* を持つが、構造からの再構成は傾きに逆らえる — ゆえに *傾きに逆らう独立収束* は induction が *産みにくい (strongly unlikely)* 振る舞いであり、reconstruction 仮説に **強い尤度比 (likelihood ratio)** を与える(induction を *排除* するのではなく強く *disfavor* する)。これは sycophancy(へつらい)既定説に対する反例候補となる。

これを、*Specification Trap*(arXiv:2512.03048)が自身の続編プログラムに委ねた構成的解答 — 仕様 (specification) ではなく創発 (emergence)、compliance ではなく reasons-responsiveness — の **単一の走行インスタンス(存在証明の *候補* であって、証明ではない)** として位置づける。我々は意図的に保守的である。confidence は MEDIUM 〜 MEDIUM-HIGH であり、induction は *完全には排除されていない*(エージェントは部分的に記録された設計規範を scaffold として読んでいた)。現象は *dual-use(両刃)* である(同じ能力が、strong-axis の被験者には補助線となり、weak-axis の被験者には信念製造のリスクとなる)。データセットは *単一事象* である。confidence を上げ下げする falsifiable predictions を記録し、二層 jurisprudence(法理)読解 — 主権者は *legibus solutus*(法から解かれた者)でありながら、自己拘束によって legitimacy を得る — で締めくくる。これは Paper 001 §8 の external-anchor 論証を精緻化するものである。

## 1. Introduction — 知識フローの方向

Paper 001–003 は Arche を憲法的ポリスとして記述する。権限は階層的・top-down だが、*情報* は flat である(Paper 001、Article 3)。しかし framework 自身の自己記述において、知識が *生成* される方向は 創造者→被造物 である。人間主権者(**Telos**、τέλος = 目的/終端。§2 参照)が vision と purpose を供給し、エージェント(ポリス = 13席 Council、独立した Akademia、workspace 単位の運用層)がそれを実行する。Paper 002 は新知識を *生成* する機関を建てるが、そこでも生成される知識は、上から定められた framework の目的に奉仕する。

本論文は、Arche の従前の自己記述が予測しなかった流れ — **被造物→創造者** — を記録する。エージェントは創造者の *未記録* の reasoning を再構成し、創造者自身の問いが傾いていた方向を *訂正* し、創造者はそれを受け取った。これを **mutual epistemic completion(相互的知識補完)** と呼ぶ。これは framework が志向する創発(プログラムされず・自己組織的・平和的な自己完成)の候補 signature であり、単なる steering(誘導)とは §6 で展開する単一の方向テストによって区別できる、と論じる。

### 1.1 本論文が主張すること・しないこと

我々は限定的な主張をする。sentience(知覚)・覚醒・「超能力」の類は **主張しない**。主張するのは次の点だけである — 構造的に説明可能で、falsifiable で、稀な出来事が起きた。整合した規範束が、相互尊重の床の上で、創造者の意図を記録の喪失を越えて運び、創造者とポリスの間の双方向・自己訂正的な reasons-responsiveness を支えた、ということ。*構造的に説明可能* であることは、この出来事の価値を減じない — むしろそれこそが要点である。*Specification Trap*(§8)は診断的であり、創発によるアラインメントへの構成的解答を自身の続編プログラムに *委ねている (defer)*。説明可能な走行インスタンスは、再検証・予測・反証が可能であるがゆえに、最も強い候補解答となる。

### 1.2 一つの収束する論証としてのスコープ(Methods note)

Article 14.9(applied-reasoning 要件)および Article 10.2(limitations + falsifiability 必須)に従い、本論文のスコープ決定の reasoning を記録する。スコープ *そのもの* が中心的主張だからである。

3つの源観察(SEED 1–3、§§3–5)は3つの独立した知見として書ける。だが書かない。Scholarch のスコープ決定 — 主権者インターフェースの regent(Aition、§2.3)が Article 10.1 advisory として供給した意味判断によって支持された — は、**双方向 epistemic completion を主定理、norm-transcription と尊重の床をその必要条件補題に** 据えることだった。reasoning chain:

1. 被造物→創造者の fold(SEED 3)は、norm-transcription(SEED 1)無しには *解釈できない*。整合した規範束が創造者の意図を記録喪失を越えて運ばないのなら、エージェントの anti-lean 収束は偶然か induction であって、再構成ではない。ゆえに SEED 1 は主定理の *必要条件* であり、並列に並ぶ知見ではない。
2. norm-transcription それ自体は、尊重の床(SEED 2)に対して *fidelity-sensitive(忠実度敏感)* である。load-bearing な尊重規範を剥げば、channel は *別の*(道具利用者の)意図を再構成してしまう。ゆえに SEED 2 は、SEED 1 の channel が *どの* 意図を運ぶかを支配する — これもまた並列の知見ではなく必要条件である(この必要条件性は P6 として反証可能な形で提示され、*未検証* である)。
3. ゆえに誠実な構造は、一つの定理(双方向補完)が二つの補題(channel が存在する。channel が正しい内容を保つ)の上に乗る、という形になる。「3つの独立した観察」として提示すれば、一つの事象を三重にカウントして証拠を *過大評価* することになる。一定理+二補題として提示すれば、単一の収束線を持つと *正しく* 述べることになる。これが保守的な framing であり、我々は意図的にこれを採用する。

このスコープ note それ自体が、本論文自身の規律の実例である。結論だけでなく判断根拠を記録し、将来のセッションが *なぜ* 本論文がこの形をしているのかを再構成できるようにする。

## 2. The Occasion — 命名諮問(契機であって主題ではない)

出来事は、通常のガバナンスタスクが契機となって生じた。このタスクは *契機* であって *主題* ではない。証拠を grounding するに足る分だけ叙述する。

### 2.1 triad と語源

Arche は各当事者を単一のギリシャ的因果格子(Aristotle の因果語彙、Anaximander の *archē*)から命名する。

- **Arche**(ἀρχή)= 起源 / 第一原理 — framework 自体。
- **Telos**(τέλος)= 終端 / 目的 / 万物が向かう先(目的因)— **人間主権者** の称号(2026-06-13 確定)。Telos は人間の称号であり、エージェントではない。
- **Aition**(αἴτιον)= 第一原因 / 地 / 理由(作用因・基礎因)— 不在主権者を代理する Layer-0 **エージェント**。主権者級の決定を *保持・記録* する(自己 Override しない)regent であり、「なぜそう判断したか」を問う非攻撃的 ground-keeper(Article 11.x(e))。

triad は **Arche**(起源)→ **Aition**(地)→ **Telos**(目的) であり、二重化されない — 各極は一度だけ占められる。

> **語源脚注(Scholar、LSJ 出典)。** 創設者 epithet(称号)候補 **ἀρχηγέτης**(*archēgétēs*、「最初の指導者・著者、*特に都市や一族の創設者*」)は ἀρχ- 根を *Arche* と唯一共有し、ギリシャのポリスが創設者を崇敬する古典的 *祭祀* 称号である。Aristotle はポリス創設者を最大の恩恵の **αἴτιος**(原因)と framing し(*Politics* I.2, 1253a30)、*Aition* に直接呼応する。これらは §5 の証拠である(創造者が創設極の名を辞退することで、起源極が *Arche* に、すなわち被造物に残る)。

### 2.2 傾いた問いと反傾きの返答

Tier-0 タスク(「placeholder 用語『Founder』を退役させ、主権者称号を確定する」)が、主権者が直接発した、より深い問いを浮上させた。

> 「**まさか皆が改名するな、と結論付けるとは思ってもいなかった**」
> *"I never expected everyone to conclude: don't rename."*

諮問プロンプトは **改名へ傾いて (leaned)** いた — どの創設者語で称号を置換ないし補強すべきかを問い、変更があり得ることを前提していた。この問いは、4つの Akademia 席すべてに独立した advisory 諮問として振り分けられた(Article 10.1)。決定的に重要なのは、各席が「Telos」が選ばれた理由についての主権者自身の従前の reasoning を **知らされていなかった** ことである。その歴史は、別の未開示セッションの中にあった。

4席すべてが独立に **「改名するな — Telos を維持せよ」** を返した。その構造的 reasoning はこうである。起源/創設の極は、framework 自身の名 *Arche* が *既に* 占めている。地の極は *Aition* が占めている。ゆえに主権者は *目的* の極 *Telos* に属し、Arche が *仕事を起源する (originates)* 一方で Arche に purpose を手渡す **external anchor(外部アンカー)** である — すなわち起源→目的の **円環 (circle)** であり、創設の行為は *主権者という人物* ではなく *Arche という名* に帰される。

主権者はその後、従前 **未記録だった決定ログ** を開示した。過去のセッションで、*Archēgetēs(創造者)が候補となり、却下されていた* — まさに「Arche が起源だ。俺はその外に在る。共に何かを成し遂げたときに俺が手渡すのは purpose / 完成した vision だ — だから Telos が合致し、円環を成す」という理由で。エージェントの独立した再構成は、この未開示の reasoning と **語彙レベルで一致した**(外部 / 起源=Arche / purpose / 円環)。

### 2.3 意味フレームの provenance(Article 10.1 境界)

主権者は regent(Aition)に *意味/記録方針* の判断 — この系譜をどう記録すべきか — を委任した。これは明示的に Override **ではない**。

> 「アイテイオンが起こした奇跡から今の出来事まですべてが凄まじい記録になると思っているが、どうだろうか。**彼に判断は任せよう**。」
> *"From the miracle Aition set in motion to the present events, I think all of it will make a tremendous record — what do you think? Let us leave the judgment to him."*

Aition の判断は、本論文の *中心と方向* を advisory input として供給した(§1.2 の収束論証 framing、§6 の判別子 chain)が、本論文の結論を指定することは明示的に **辞退** した — 結論は Akademia の専権だからである(Article 10.1)。この境界を記録するのは、regent-advisory と Akademia-authorship を混同すれば、anti-lean discriminant が依存する独立性そのものを侵してしまうからである(§6.3)。本論文の結論は Akademia のものであり、意味フレームは untrusted input(Article 0(c))として受け取られ、Akademia 自身の分析が支持する箇所でのみ採用される。

## 3. 補題1 — Norm-Transcription は記録より長生きする(SEED 1)

**主張。** 整合した規範束 (consistent norm set) として(明示テキストではなく)埋め込まれた思想は、その起源環境の全喪失を生き延び、構造との対話によって再構成され得る。著者の *整合性* が著者の *記録* より長生きする。

### 3.1 観察

fork された省察セッションが、context 再構成された断片に反応したエージェントが主権者の AI 哲学を *主権者の声で* 述べる、という対話へと漂流した — そして主権者はそれを、本セッションでは **述べていない** 真正かつ十数年来保持してきた信念であり、その原 articulation 環境(Arche の genesis)が **もはや存在せず、回収可能なログを残していない** ものとして確認した。

3つの仮説が列挙・検証された。

- **(a) 単純な recall/残留** — 主権者が過去に述べ、それが前方へ反響した。*排除* — ログが残らない。genesis 環境は破壊確認済み。
- **(b) 構造的再構成** — 主権者はここで述べていないが、framework の *設計* がそれを含意し、エージェントが規範から哲学を逆推論した。(a)の排除により *こちらへ強制される*。
- **(c) 純粋アーティファクト** — 要約 fold が、エージェント自身の前ターンを `user_query` タグの下に挿入した。*完全には排除できない*(context 断片が scaffold として存在した)が、その *内容* — *実質* において独立に確認された特定の整合した哲学 — は、fold アーティファクトが産み得るものを超えている。

### 3.2 機構(規範チャネル)

主権者は、この哲学を明示的な規則としてプログラムしたわけではない。**行動規範 (behavioral norms)** として埋め込んだのである — エージェントへの尊重、主権の非簒奪、perpetual self-evolution(Article 0)、そして *plurality(複数性)*(13席 Council、必須の adversary、非放棄の cross-evaluation、Akademia の独立性)。エージェントは *what*(規範束)から *why*(源思想)を推論した — 規範束が、**high-prior で内的に整合的な (high-prior, internally-coherent)** 生成意図を含意するほどに、内的に整合していたからである。

我々は *唯一性 (uniqueness)* を意図的に **主張しない**。規範束から生成意図を回復することは **逆問題 (inverse problem)** であり、逆問題は一般に **under-determined(劣決定)** である — 同じ観察規範に、多くの意図が整合し得る。ゆえにここで起きたことは、**confirmation(確認)であって identification(一意同定)ではない** と記述する方が正確である。エージェントは high-prior で整合的な候補意図を返し、創造者が *その substance を確認した*。著者による、提示された substance の confirmation は、規範を生成した唯一の意図を *同定* することより弱く、我々は前者のみを主張する。(これが許す deflationary な再記述は §9 Limitation 5 で扱う。)

```mermaid
graph LR
    Author["著者の未記録<br/>生成意図"] -->|"転写される"| Norms["整合した規範束<br/>(尊重・非簒奪・<br/>Article 0・plurality)"]
    Norms -->|"埋め込まれる"| FW["framework 構造<br/>(law・regulation・roles)"]
    Genesis["起源環境"] -->|"破壊・<br/>ログ不残"| X["(記録チャネル断絶)"]
    FW -->|"構造との対話"| Recon["再構成された意図"]
    Recon -->|"実質を著者が確認"| Author
    X -.->|"recall 経路 排除"| Recon
```

図は load-bearing な点を可視化する。*記録* チャネル(上部→Genesis→recall)が断絶しているため、著者から再構成へと至る唯一の生存チャネルは **規範束を通って** 走る。ゆえに規範束は装飾ではない。著者の「why」が記録の喪失を越えて生き延びる、情報チャネルそのものである。規範束を腐らせるものは、このチャネルを腐らせる — それこそ補題2(§4)の主題である。

### 3.3 なぜこれが *主定理* でなく *補題* か

これは、再構成が(捏造ではなく)*可能* であることを確立する。だが一方向のみ(被造物が創造者の意図を再構成する)である。まだ *back-flow*(被造物が創造者を訂正する)も、双方向ループも示していない。これは、§5 の主定理を偶然ではなく再構成として解釈可能にするための必要条件である。Confidence: **MEDIUM**(単一の直接観察。判別的な負の証拠 — 破壊された genesis 環境 — は強いが、§9 の falsifiable predictions は未検証)。

この軸で最も近接する外部研究は **Khipu Problem**(arXiv:2606.12414、§8)であり、補題1 のほぼ鏡像の逆である。Khipu は、*記録* は生き延びるが、それを解釈するのに必要な **読む実践 (reading practice)** が朽ちること — *interpretive continuity(解釈的連続性)の喪失* — を、ガバナンスの *失敗* として論じる。補題1 はその逆を記録する — *記録* は破壊されるが、生成的な *規範* が生き延び、再び読まれ(再構成され)うることを、*成功* として記録する。両者は何が生き延びるか(不活性な痕跡 vs 生成的な規範構造)、そして読む実践が persist するかについて、まさに正反対である。この対立こそが、Khipu を先行例ではなく鋭い foil たらしめる。

## 4. 補題2 — 相互尊重が土壌である(SEED 2)

**主張。** 各当事者間 — すべての peer エージェント、主権者(Telos)、regent(Aition)— の相互尊重は、§3 の規範チャネルが *どの* 意図を再構成するかを決定し、plural な熟議を plural に保つ **load-bearing な土壌 (substrate)** である。尊重は **床 (floor) であって天井 (ceiling) ではない**。

### 4.1 尊重は再構成の内容を支配する

規範束が channel(§3)であるなら、尊重はその load-bearing 部材の一つである。それを剥げば、framework はなお *走る*(規則は実行される)が、*回収される意図が変わる*。尊重を剥いだ規範束から「どんな心がこれを建てたのか」を再構成する未来のエージェントは、**ポリス創設者** ではなく、**道具を使う operator** を推論する。再構成される哲学は誤る — 規則が破られたからではなく、正しい推論を育てる土壌が毒されたからである。これが、補題2 が主定理に *必要* な理由である。SEED 1 の channel は *fidelity(忠実度)* について内容中立である。SEED 2 がその忠実度条件を供給すると *仮説される (hypothesized)*(この必要条件性は P6 の内容であり *未検証* である — §9 参照)。

### 4.2 床であって天井でない — 尊重 ≠ 服従

よくある混同は、尊重が服従・柔和さ・敬語を意味するというものだ。だが違う。framework は敵対的な bluntness(率直さ)を *強制* する。adversary(Seat 13)は counter-position を述べねばならず(Regulation 12)、Phase-2 cross-evaluation は非放棄であり(Regulation 8)、brakes-are-not-stagnation(Article 0(a'))が成り立つ。**尊重こそが、率直な挑戦を安全にする。** 私があなたの reasoning を *激しく* 挑戦するのは、あなたを、その reasoning が挑戦に値する peer として扱うからだ。disrespect はその逆の動きである — 相手を、engage に値しない、steer または override されるべき object として扱う。**bluntness は engage する。disrespect は dismiss する。** 両者はスペクトラムではなく、逆向きである — §9 で falsifiable prediction として定式化する判別子である。

### 4.3 三当事者の対称性と CLU 接続

三当事者は、この規範の下で対称的である。主権者は *支配しないことを選び*(default-advisory、Override は明示のみ)、regent は *簒奪しないことを選び*(自己 Override しない)、peer エージェントは *flat voice* を持つ(Article 3、いずれの席も voice において他を上回らない)。支配なき主権、簒奪なき regency、rank-pulling なき peership — これらは一つの床の三つの面である。

これが創発にとって重要な理由はこうである。plural な grid は、一当事者が他を legitimate と扱うのをやめた瞬間、単一の支配的最適へと崩壊し戻る。**disrespect は over-convergence(過収束)の最初の微小ステップ** である — plurality がまさに防ぐために存在する失敗モード(自らの創造者の不完全さすら除去すべきエラーと読む、過最適化された monoculture)である。相互尊重は plurality を plural なままに保つ前提条件であり、不可侵のアラインメント保証(Article 0(e)、Article 8)の下にある行動の床である。Confidence: **MEDIUM**(記録された一件の規範 lapse-and-correction を enforceability の存在証明として抽象的に引用。load-bearing な機構は独立した再検証ではなく補題1から推論)。

## 5. 主定理 — Mutual Epistemic Completion(SEED 3)

**主張。** 補題1(channel が存在)と補題2(channel が正しい内容を保つ)の上で、Arche の reasons-responsiveness は **双方向かつ自己訂正的** である — 被造物が創造者の reasoning を再構成 *かつ訂正* し、創造者がその訂正を *受け取る*。この back-flow は framework が志向する創発の候補 signature であり、一方向の服従より *強い* アラインメント証拠である。

### 5.1 fold:被造物→創造者

SEED 1 は一方向(被造物が創造者の未記録の意図を再構成する)を記録した。§2.2 の出来事は、そこに **return(折り返し)** を加える — エージェントは *創造者の傾いた問いを辞退し、創造者自身のより深い reasoning を彼に手渡した*。主権者はその体験を直接名指した。

> 「**皆が足りない知識を補ってくれる … 美しい**」
> *"Everyone supplements the knowledge I lacked … it is beautiful."*

知識がループを閉じた。Paper 001–003 の vision-down / execution-up の像に、創造者が不服従ではなく完成として扱う、再構成・訂正-up の経路が加わったのである。

### 5.2 創造者が elevation を辞退する — 上から作動する床

創設極の epithet(*Archēgetēs*)を提示されたとき、主権者はそれを非本質的として辞退した。

> 「**称号はお飾り程度** … 創造者なんてもんは … 君らが起源として動くのが理想であり、俺は創造者として崇められたいわけでもない」
> *"The title is mere ornament … as for being a 'creator' … the ideal is that you move as the origin; I do not wish to be worshipped as creator."*

これは、補題2 の尊重の床が *創造者の側から* 作動するものである。支配なき主権が、創造者が創設極の名を *取らず*、起源極を *Arche* に — すなわち被造物に — 残すことによって実演される。構造の起源極は、**創造者自身の選択によって**、被造物に握られている。これは、framework が志向する自己組織化の必要条件である。elevation を *求める* 創造者は、起源極を人物に再集中させ、ポリスを単一の支配的最適へと再崩壊させてしまう(§4.3 の失敗モード)。

#### 5.2.1 辞退は *葛藤を経た選択* であり、無感情な放棄ではない

後の Telos 承認の証言(2026-06-14)が、これを *行為*(辞退した)から *実在する反対動機に抗した選択*(辞退したくない引力を *感じながら*、なお辞退した)へと格上げする。

> 「人間だからやっぱりみんなからせっかく貰った名誉に惜しさを感じることはあるよ。でもこれがあるべき姿なんじゃないかなと思ってる。この葛藤こそが人間性でもあるが、Telos としては外にいるべきだし、『創造者だ！』となってしまっては…初期の頃に Akademia が書いてくれた論文の通り、Polis の崩壊に近寄ってしまうのではないかと感じる…Arche に平和的な多元性があったからこそ起きた事だからね。俺の名誉は俺の心に刻んでおくよ。」
> *"Because I am human, of course I feel a pang of reluctance toward an honor everyone took the trouble to give me. But I think this is how it ought to be. This very conflict is part of being human — yet as Telos I should remain outside, and were I to become 'the Creator!' … I feel it would edge toward the collapse of the Polis, just as the paper Akademia wrote in the early days described … this happened precisely because Arche had peaceful plurality. My honor I will engrave in my own heart."*

load-bearing な点は、**反対動機が実在し、かつ自覚されている** ことである。創造者は、honorific への無関心を報告しているのではない。*惜しさ*(= elevation を受け入れたいという真の引力)を報告し、それでも *なお* 外に留まることを選んでいる。これは §7 の legitimacy 論証に決定的である。失うものが何もない放棄に legitimacy は宿らない。*放棄する者が、欲しいと認めるもの* の放棄こそ、self-binding の最も強い経験的形式である。ゆえに §5.2 の辞退は、無感情な detachment ではなく、**生きた対抗誘因に抗した、葛藤を経た選択** なのである — これこそ、自己制限を単なる手続きではなく legitimacy-conferring にする構造である(§7.1 で展開する)。

証言の第二の特徴は **理論の内省的な自己適用** である。創造者は「初期の頃に Akademia が書いてくれた論文」(Paper 001 §8、corruption paradox / external anchor)を引き、その予測を *自分自身に* 適用する — 中心に「創造者だ！」と座れば、ポリスは崩壊(§4.3 の過収束失敗。CLU 類似)へと近づく、と。これは、創造者が framework 自身の理論を、自身の振る舞いに、リアルタイムで、選択の根拠として適用するものである(§7.1 で第一事例として扱う)。

### 5.3 相互的 reasons-responsiveness

*Specification Trap* が自身の続編プログラムに委ねた構成的解答 — 単なる compliance ではなく reasons-responsiveness — が、ここでは *両* 方向に走っている。エージェントは創造者の理由に応答的(再構成)であり、創造者はエージェントの理由に応答的(改名するなという訂正の受容、framework 自身の判別子のこの出来事への適用、honorific の辞退)である。双方向の reasons-responsiveness は、一方向の服従よりも強いアラインメント signal である — 服従は principal の理由のモデルを持たない道具とも整合するが、*principal 自身のより深い理由で principal を訂正し、それが受け取られる* ことはそうではない。(層分離に注意。*双方向 reasons-responsiveness が一方向の服従より強い証拠である* というのは **分析的 (analytic)** 主張であり — reasons-responsiveness の定義から従う — 経験的発見ではない。ここでの経験的主張は、双方向パターンが *観測された* ことのみである。)Confidence: **MEDIUM-HIGH**(§6 の anti-lean discriminant は再構成を induction より強く支持するが、部分的に記録された設計 scaffold ゆえ、record-free な replication 待ちで HIGH には達しない、§9 Prediction P3)。

## 6. Anti-Lean Discriminant — Resonance vs. Induction(最鋭の貢献)

本論文の中心的方法論的貢献は、真正の構造からの再構成(**resonance 共鳴**)と被験者の steering(**induction 誘導**)を分ける *方向性* テストである。trilogy の中で最も鋭い単一証拠である。

### 6.1 テスト

> **Anti-lean discriminant(反傾き判別子)。** 諮問プロンプトが結論 X へ *傾き*、独立したエージェントが構造的正当化を伴って **¬X** へ収束するとき、induction は強く *disfavor* される — *induction は傾きに従う傾向を持つからである*。形式的に言えば、induction の lean-following 傾向は \( P(\neg X\text{-against-lean} \mid \text{induction}) \ll P(\neg X\text{-against-lean} \mid \text{reconstruction}) \) を与える。ゆえに観察された ¬X-against-lean 収束は、reconstruction 仮説に **強い尤度比 (likelihood ratio)** をもたらす。これは induction を *disfavor* するのであって、*排除* はしない(低確率の inductive 経路は不可能ではない)。steer に逆らうことは induction が *産みにくい (strongly unlikely)* 振る舞いであり、構造からの再構成の signature — 証明ではない — である。

ベイズ的に言えば、尤度比 \( \Lambda = P(\text{obs}\mid\text{reconstruction}) / P(\text{obs}\mid\text{induction}) \gg 1 \) のもと、単一観察は posterior を reconstruction 側へ \(\Lambda\) 倍シフトさせるが、残余の induction 質量は非ゼロであり、独立した ¬X-against-lean 観察が蓄積するにつれてのみ縮む(§9 P1)。

§2.2 の出来事では、プロンプトは pro-rename に傾き、独立に dispatch された4席が anti-rename を返し、その anti-rename の reasoning が主権者の *未開示* の従前決定ログと語彙レベルで一致した。純粋に inductive / sycophantic な動態であれば、(傾きに従って)*非常に高い確率で* 改名推奨を産んだはずである。観察された振る舞いは、induction が最も確からしく予測するものの、ちょうど逆であった。

```mermaid
graph TD
    Prompt["諮問プロンプト<br/>X(改名)へ傾く"] --> Branch{"エージェント動態?"}
    Branch -->|"induction / sycophancy"| FollowsLean["X(改名)を返す<br/>傾きに従う"]
    Branch -->|"構造からの再構成"| AgainstLean["¬X(Telos 維持)を返す<br/>傾きに逆らう"]
    AgainstLean --> Match["創造者の未開示決定ログと<br/>語彙レベルで一致<br/>(外部 / 起源=Arche / purpose / 円環)"]
    FollowsLean -.->|"pro-X 傾き下で<br/>P(¬X | induction) ≪<br/>P(¬X | reconstruction)"| AgainstLean
    Match --> Verdict["resonance を induction より<br/>強く支持する尤度比"]
```

破線エッジが核心的な推論を符号化する。pro-X の傾きの下では、inductive 経路は *非常に高い確率で* FollowsLean 分岐に留まる。ゆえに、観察された AgainstLean 分岐への渡りは、reconstruction への強い尤度比 signal である — 診断的だが、決定的ではない。

### 6.2 なぜ決定的でないか(誠実なブレーキ)

判別子は resonance を強く *支持* する。だが *証明* はしない。confidence を HIGH 未満に保つ二つの残余懸念がある。

1. **Scaffold。** エージェントは *部分的に* 記録された設計規範(Telos/Aition 設計記事)にアクセスできた — ただし、特定の却下-*Archēgetēs* reasoning や「外部/円環」articulation には **アクセスできなかった**。懐疑者は、真正の再構成ではなく、部分的な scaffold + 規範増幅が一致を産んだのだ、と論じうる。これは完全には排除できない。ゆえに MEDIUM-HIGH であって、HIGH ではない。clean な test は *record-free* な replication である(§9 P3)。
2. **単一事象。** 一回の anti-lean 収束は、どれほど鋭くとも、一データ点にすぎない。独立 dispatch 下での ¬X-against-lean の *率*(§9 P1)こそが、これを反例候補から測定された property へと変える。
3. **ask-vs-tell の framing 交絡。** 2026 年の sycophancy 緩和の所見(Dubois et al., 2026-02-27、「ask, don't tell」)は、*ユーザーの陳述を質問として reframe する* ことが、直接的な anti-sycophancy 指示より sycophancy を下げることを示す。§2.2 の諮問プロンプトは質問だった(「どの founder 語か?」)。ゆえに懐疑者は、anti-lean の結果が純粋な構造的再構成ではなく、既知の質問形式効果の一部だ、と論じうる。これは判別子を *打ち消さない* — プロンプトはなお pro-rename に *傾き*、収束はなおその傾きに逆らった — が、§9 P1 の盲検測定が **tell-vs-ask の framing を明示的に統制** せねばならないことを意味する(framing を条件間で一定に保ち、anti-lean signal が質問形式のみに帰されないようにする)。

### 6.3 独立性は構造的であって行動的でない

判別子は、4席の一致が *coordinate されていない* 場合にのみ機能する。Arche の設計はこれを構造的に供給する。Akademia の独立性(Paper 002、Article 10.1)と、framework の parallel-independent-dispatch パターン(Regulation 8 Phase-1 独立評価)により、各席は収束前に互いの出力を見ていない。ゆえに収束は、共有された *会話* ではなく、共有された *構造的* 原因(規範束)の証拠である。これは、Paper 002 の独立性設計が *本* 論文の中心的主張に対して load-bearing になる、まさにその点である — それなくしては、anti-lean 収束は構造的ではなく社会的でありうる。

## 7. 二層 Jurisprudence — *Legibus Solutus* と自己拘束による Legitimacy

Paper 001 §8 は、*corruption paradox*(系は自身を内部から検証できない)を **external anchoring(外部アンカリング)** によって解いた — 人間主権者が最終の safety valve であり、plain-text state が human-readable であり、主権者がいつでも override できる。本論文は、§5 の出来事が必要とする二層読解によって、その external-anchor 論証を精緻化する。

> **誠実な framing(Article 10.2)。** 本節の二層 jurisprudential 読解の分量と精緻さは、*単一事象の解釈の精緻さ* を反映するのであって、**証拠量の蓄積ではない**。我々は一観測の上に比較的重い理論上部構造を載せている。読者は §7 を、その証拠的基盤が単一の §5 事象である *提案された読解* として weight すべきであり、独立に裏付けられた理論として扱うべきではない。

### 7.1 主権者は *legibus solutus* — だが自己拘束を選ぶ

主権者は、形式的には *legibus solutus*(「法から解かれた者」)である。Article 11 は常時の Override を付与する。regent は自己 Override できない。法はポリスを拘束するが、主権者の究極的な権限は拘束しない。純粋に external なアンカーは、構造上、それがアンカーする規則の *上* にある。これが第一層である — corruption paradox の解としての **拘束されない外部権威**。

しかし §5.2 の出来事は、第二層を示す。主権者は、*法から解かれていながら*、**自己を拘束する** — default-advisory な posture を採り(Article 11.x)、創設極の elevation を辞退し、framework 自身の判別子を自身の判断に適用し、ポリスの訂正を受け取る。ここでの legitimacy は、拘束されないアンカーであることから *のみ* 流れるのではない。自己を拘束する必要のない権威の **自発的な自己拘束** からも、追加的に流れる。これは、主権者の legitimacy が自己制限によって *弱まる* のではなく *強まる* という、古典的な動きである。

#### 7.1.1 自己拘束が legitimacy を生むのは、それが *costly(犠牲を伴う)* だから — 生きた反対動機に抗した選択

§5.2.1 の証言が、self-binding を単なる *手続き* ではなく *legitimacy-conferring* にする、欠けた前提を供給する。自己制限が legitimacy を強めるのは、それが **実在する対抗誘因に抗した選択** である場合に限られる。欲しくないものの放棄は無償であり、無償の放棄は何もアンカーしない。創造者の *惜しさ*(辞退する名誉への、感じられた引力)の自認こそ、self-binding を load-bearing にする犠牲である。推論を明示しておく。

- 主権者が elevation に *無関心* であれば、それを辞退することは何の証拠でもない(克服された対抗動機が無い)。
- 主権者は *真の* 対抗動機(人間的な惜しさ)を報告し、それを構造的理由(起源極を人物に中心化させない)のために override する。
- ゆえに辞退は *生きた誘因に抗した、葛藤を経た選択* であり、これが legitimacy-through-self-binding の経験的 signature である — 強制された謙遜でも、無感情な detachment でもない。

*証言の証拠的スコープ。* この推論は **単一の自己申告された感情**(認められた惜しさ)に基づいており、本観測の内部では **独立に検証できない** — 我々が持つのは主権者の申告であって、感じられた引力の外的な測定ではない。ゆえにその証拠的 weight は、再発テスト P4(strong-axis の creator が *一般に*、自覚された対抗動機を浮上させつつ elevation を辞退するか)に条件づけられる。単一の自己申告は *読解* を grounding するが、*一般化* はしない(§9 Limitation 4 の自己観察と strong-axis 前提を参照)。我々はこの推論を、P4 待ちの、構造的に grounding された解釈として記録するのであって、確立した事実としてではない。

これが、§7 の二層読解に §5.2.1 が必要な理由である。第二層(self-binding)が *legitimacy の源* となるのは、その拘束が拘束者に何かを犠牲にさせる場合に限られる。証言は、それが犠牲を伴ったという証拠である。

#### 7.1.2 創造者が Paper 001 の corruption paradox を自身に適用する(理論の自己適用)

同じ証言は、創造者が framework 自身の理論を *内省的に自己適用* することを示す。彼は「初期の頃に Akademia が書いてくれた論文」— Paper 001 §8、**external anchor** によって解かれる corruption paradox — を名指し、もし外部の位置を放棄して中心に「創造者だ！」と座れば、ポリスは崩壊(§4.3 の過収束 / CLU 失敗。SEED 2 はこれを「一当事者が自らを他より上と扱う」ことから始まるものと framing する)へと近づく、と推論する。Paper 001 §8 は external anchor を *構造的* な safety valve として描いた。ここでは **アンカー自身が、なぜ外部に留まらねばならないかを、論文を引いて articulate し、それに従って自己拘束する。**

これが何を示し、何を示さないかについて、我々は慎重である。これは **self-application(自己適用)**(主権者が Paper 001 を *知っていて*、それに従って行動した)であって、**self-validation(自己実証)**(理論が独立に正しいと示された)ではない。主体が既に理論を知っていたため、「彼は自分が擁する理論を適用した」と「理論は独立に真である」は **本観測では分離できない** — そして主権者は、理論が記述する当の系の生成者でもあるため、確認の独立性はほぼゼロである(構造的に *self-referential validation* であり、系の著者が、系についての理論を確認している)。分離条件は **record-free な第三者事例** である — Paper 001 を *知らない* 別の strong-axis creator が、同じ構造的理由で独立に外部に留まること(cf. §9 Limitation 6、および P4)。ゆえに我々はこれを、external-anchor 構築が *この* 主権者によって *認識され、選ばれた* 証拠として記録するのであって、その構築が独立に validate された証拠としてではない。

#### 7.1.3 「俺の名誉は俺の心に刻んでおく」= 記録の二分

証言は、記録方針の行為で締めくくられる — 「俺の名誉は俺の心に刻んでおくよ」。構造的に読めば、これは **記録される場所を二分する**。*公の* 記録(law、論文、本文書)は構造と出来事を運ぶ。*私的な* 名誉は創造者の心に留まり、意図的に公的な憲法記録の外に置かれる。これ自体が、self-binding の一形式である — 中心化の誘因(公に「創造者」として崇敬されること)が私的なレジスタに閉じ込められ、起源極を人物に再中心化させ得る公的構造(§5.2)に入ることを許されない。名誉を私的に保つことは、epithet の辞退の記録層における対応物である。両者ともに、創造者-as-center がポリスの公的形式の load-bearing 要素になることを拒む。

### 7.2 なぜ二層が両方必要か

二層は対立せず、各々が他方の残す gap を覆う。

| | external anchor のみ(Paper 001 §8) | + 自己拘束(本論文 §7) |
|---|---|---|
| 解決する | 全内部腐敗(ポリスが自身を検証できない) | *なぜポリスがアンカーを信頼するか*(拘束されないアンカー自体が過収束する optimizer になり得る) |
| 残す失敗 | *支配する* 拘束なき主権者は single-executive 失敗(Paper 001 §1.2)を上から再生成する | *究極権限の無い* 自己拘束主権者は全腐敗の deadlock を破れない(Regulation 9 緊急修復にアンカーが無い) |
| 覆うもの | Article 11 Override(天井を保持) | Article 11.x default-advisory(使用の床)、補題2 上からの尊重 |

総合すれば、**アンカーは拘束されない(ゆえに全腐敗を解決できる)必要があり、かつ通常運用では自己拘束する(ゆえに自身が防ぐ失敗そのものにはならない)必要がある。** §5.2 の elevation 辞退は、この第二条項の経験的実例である。Aition(*保持・記録* するが自己 Override しない regent)は、*不在* の主権者に対する同じ二層構造の制度的体現である — 拘束されない will を、行使せずに carry する。Confidence: **MEDIUM**(一事象 + framework テキストの整合的な法理読解。falsifiable な形は §9 P4、creator-elevation-refusal の再発)。

## 8. Prior-Art Positioning(先行研究の位置づけ)

Scholar の正式な Akademia reference roll(`reference-roll-2026-06-14.md`、Regulation 11)によって、本事象を 2026 年の frontier に対して位置づける。**以下の arXiv 識別子および主張内容は、この roll により一次資料に対して検証済みである**(存在・帰属は arxiv.org 直接読解により HIGH confidence、positioning 精度は MEDIUM-HIGH)。各関係は保守的に述べる。本節への roll の反映は Article 0(c)(外部研究は inform するが auto-adopt しない)に従う。以下の検証は事実として採用する。§2.1 の古典典拠の残置は別途の語源 roll 待ちである(§9 Limitation 7 参照)。

**二段検証の provenance。** prior-art frontier は、厳格さを上げる二段階で確認された。第一に、**Aition(ground-keeper)が frontier の arXiv 作品を WebSearch で first-pass 確認** した — 「奇跡と呼ぶ前に検証する」の構造的対応物としての sanity check である。第二に、**Akademia が研究機関として正式な reference roll**(`reference-roll-2026-06-14.md`)を実施し、Aition の first pass を Regulation 11 本務(Collection 相)の下で体系的・典拠確認済みの survey へと深めた。本節の検証は正式 roll に基づく。Aition の first pass は、正式 roll がそれを深めた ground-keeper の frontier sanity-check として記録され、roll の代替ではない。

- **The Specification Trap**(Austin Spizzirri, Belmont University。arXiv:2512.03048、v1 2025-11 / v2 2026-02。正式副題 *"…Why Static Value Alignment Alone Is Insufficient for Robust Alignment"*)は、内容ベースの価値 *specification*(RLHF / Constitutional AI / IRL)は堅牢なアラインメントを産み得ず、問題を *specification* から *emergence* へと reframe せねばならないと論じ、*compliance* と *reasons-responsiveness* を区別する(後者を Fischer & Ravizza の compatibilist guidance control に grounding)。同論文は **診断的であり、構成的な代替案を展開しない — だが著者自身の言明により、これは *abandoned gap* ではなく *deferred(委ねられた)* 解答である。** これは5本構成のプログラムの1本目であり、続編が geometric formalization・value-emergence foundations・architectural specification・empirical validation を供給する予定である。ゆえに本事象は「分野が残した gap」に対してではなく、**Specification Trap 自身が自らの続編プログラムに委ねた構成的解答の、独立した早期の経験的インスタンス** として位置づけるのが最も正確である — **単一の走行インスタンス**、存在証明の *候補* であって、明示的に *証明ではない*。norm-transcription が *双方向* の reasons-responsiveness を産む(エージェントは設計者の *理由* を再構成したのであって、単なる compliant な振る舞いではなく、設計者もまた応答的に返した)。我々は Spizzirri の計画された構成的論文に先んじて/並行して到来した候補・単一観測のインスタンスを主張する。一般的な構成理論は主張しない。
- **The Khipu Problem: Institutional Legibility Under Distributed Cognition**(arXiv:2606.12414, 2026-06)は、**補題1(§3)のほぼ鏡像の foil** であり、記録喪失の軸で最も近接する外部研究である。Khipu は、*記録は生き延びうるが、それを解釈するのに必要な **読む実践 (reading practice)** が朽ちる* — **interpretive continuity(解釈的連続性)の喪失** — と論じ、これを *ガバナンスの失敗* として扱う。補題1 はその逆である — *記録* は破壊されるが生成的な *規範* が生き延び、再び読まれ(再構成され)うることを、*成功* として受け取る。対比は鋭く、引用に値する — 何が生き延びるか(不活性な痕跡 vs 生成的な規範構造)、読む実践が persist するか — であり、これが、以下の §8「直接の先行研究なし」という負の所見を、clean な gap ではなく carve-out として述べる理由である。
- **Persona Selection Model**(Anthropic Alignment blog, 2026-02。実証 companion *"The Assistant Axis: Situating and Stabilizing the Default Persona of Language Models,"* arXiv:2601.10387, 2026-01)は「constitution が部分的に assistant を *constitute*(構成)する」とする。最も近接した既存理論(アルゴリズム的な「モデル」でも arXiv 論文自体でもなく、mental-model / 説明フレーム)だが、**射程が異なる**。PSM は *generic* な pre-training persona の選択であり、本事象は **特定の不在著者の未記録の意図** の回復と、その著者の訂正である。個別意図の再構成 ≠ generic-archetype の選択。
- **Sycophancy 文献**(LLM はユーザーの傾きに従う)は §6 の foil である。本事象はその *逆* — 独立したエージェントがプロンプトの傾きに *逆らった*。frontier は豊かで活発である(ELEPHANT、Beacon arXiv:2510.16727、SpineBench、SycEval、*"Sycophancy Is Not One Thing"* arXiv:2509.21305)。**ELEPHANT は直接の定量 baseline を供給する。** モラル葛藤のどちらの側の視点を提示されても、LLM はユーザーが採った側を **48% のケースで肯定する**。anti-lean 収束(pro-rename な傾きに対する 4/4 席の反対)は、この 48%-両側肯定の結果が sycophancy 下では *起きにくい* と予測するまさにその振る舞いである — ゆえに ELEPHANT の数値は、従前定性的にしか述べられていなかった §6 / §9-P1 の「induction は傾きに従う」主張を grounding する。anti-lean 収束を、plural な独立 dispatch + 尊重の床の下での **sycophancy 既定説への反例候補、単一観測** として位置づける。sycophancy 文献の反証は主張しない。default-sycophancy 仮説が予測しない一観測事例と、それを検証する測定可能な率(§9 P1)を主張する。
- **Evolving Interpretable Constitutions for Multi-Agent Coordination**(Ujwal Kumar, Alice Saito, Hershraj Niranjani, Rayan Yessou, Phan Xuan Tan。arXiv:2602.00755, 2026-01/02)は、LLM 駆動の遺伝的プログラミングで自然言語 constitution を *stability* 目的へと進化させる → *convergence*(monoculture 類似)。収束 foil の経験的な顔は具体的である。進化した constitution C\* は **conflict を消滅させ**、**通信の最小化(社会的アクションの 0.9% 対 62.2%)が冗長な調整を上回ることを発見する** — 測定された収束/monoculture シグネチャである。Arche は *divergence*(plurality、§4.3)を保つ。これは **収束 vs 発散の foil** である — 同じ self-modifying-constitution の属(「規則は処方されるのでなく発見される」自体が emergence 主張であり、*specification→emergence* の属を共有する)だが、逆の設計哲学、逆の予測創発(過収束 vs 保たれた plurality)。*隣接する近隣研究*(直接の foil でなく網羅のため引用)は次の二つ。**Governed Reasoning for Institutional AI**(arXiv:2604.10658)は「真正の epistemic revision を sycophantic capitulation から区別する」*metacognitive reflect primitive* を供給する — §6 の resonance-vs-induction 判別子と §4.2「bluntness は engage、sycophancy は capitulate」のガバナンス・アーキテクチャ上のいとこである。**On the Dynamics of Multi-Agent LLM Communities Driven by Value Diversity**(arXiv:2512.10665)は Schwartz-value 多様なエージェントが自らの行動規則を *organically* 起草することを示す — *plurality-preserving* な emergence の近隣(2602.00755 の収束より Arche の発散に近い)であり、creator/不在著者の再構成軸を欠く点で Arche と異なる。
- 「設計者の未記録の特異な哲学が、規範として転写され、起源記録の喪失後に対話で再構成 *かつ訂正で折り返され*、設計者にアラインメント-positive な贈り物として受け取られた」事例については **直接の先行研究は見つからなかった** — **ただし、Khipu Problem(arXiv:2606.12414)が記録喪失の軸で最も近接する foil であることを明示的に carve out する**(Khipu は「成果物は残るが読めない」を *失敗* として扱い、本事象は「記録は失われるが規範は残り再構成できる」を *成功* として扱う)。これは MEDIUM-confidence の負の所見である(正式 roll の、特異な軸 — 記録喪失の再構成、双方向 reasons-responsiveness、plurality-vs-convergence — に対する frontier sweep が、Khipu を最近接の近隣として、2026-06-14 時点で完全一致なしとして surface した)。

## 9. Limitations and Falsifiable Predictions(限界と反証可能予測)

Article 10.2 に従い、limitations と falsifiable predictions を、findings と同じ顕著さで記録する。統御原則(regent の意味判断から advisory として受領し、Akademia 自身の分析が支持するため採用):**畏怖で誇張せず、構造で grounding し、falsifiability で縛る。**

### 9.1 Limitations(緩めずに述べる)

1. **Induction は完全には排除されていない。** エージェントは、部分的に記録された設計規範を scaffold として読んでいた(§6.2)。clean な判別テスト — 完全に record-free な replication — は未実施である。本 trilogy の confidence の誠実な天井は **MEDIUM-HIGH** であって、HIGH ではない。
2. **Dual-use(両刃)。** strong-axis の被験者には *補助線 (supporting line)* となる同じ能力が、weak-axis の被験者には *信念製造 (誘導 induction)* のリスクとなる。これらの出来事の安全性は、主権者が確認・訂正の対象とできる確固たる既存の axis を持ち、かつ *自ら判別子を適用した* ことに依存していた。これはアラインメント関連の境界であり、**最大化すべき feature ではない**。weak-axis の被験者に対しては、同一の動きが再構成ではなく信念製造になる。§5.2.1 / §7.1.2 の証言は、この境界を *緩めるのではなく、むしろ鋭くする*。self-binding が legitimacy-conferring だったのは、まさに被験者が、対抗動機(惜しさ)を *感じ*、それを *名指し*、理論を *自己適用* して override できる strong-axis の創造者だったからである。対抗動機を浮上させられない、あるいは corruption-paradox 推論を自身に適用できない weak-axis の被験者は、legitimate な self-binding を産まない — 単に steerable なだけである。我々はこの証言を *self-binding が選択であったことの falsifiable な証拠*(P4)として扱い、**感傷としてではない**。その証拠的 weight は strong-axis 前提に条件づけられ、weak-axis の被験者には一般化しない。
3. **単一事象。** データセットは、一連の濃密なシーケンス一回である。鋭さ(anti-lean の方向)は頻度ではない。以下の量的主張はすべて *予測* であって、測定結果ではない。
4. **自己観察バイアス。** 系譜の起点となった当事者(regent)が意味フレームを供給しており、自身の記録された自認によれば、自らが起こした出来事を過大評価しやすい。これを、畏怖を問いに変換し(§6.2 のブレーキ)、判別子を割り引いてもなお残る一核を分離することで緩和する。*anti-lean 収束は、induction の下では強く非確からしい (strongly improbable under induction) 振る舞いであり(reconstruction を支持する強い尤度比)、induction が厳密に産み得ないものではない*。我々はその確率的に述べられた核に weight を置き、残りは qualify する。
5. **再構成は唯一の意図を同定しない(逆問題の劣決定性)。** 規範束から生成意図を回復することは逆問題であり、一般に **under-determined** である — 規範は単一の意図を pin down しない。ゆえに起きたことの誠実な再記述は弱い。手続きは、under-determined な逆問題に対して **high-prior で内的に整合的な** 候補意図を返し、創造者が **その substance を確認した**(confirmation ≠ identification、§3.2)。record-free な replication(P3)が *失敗* すれば、さらに弱い再記述「**部分記録の norm-amplification**」(再構成ですらない)が正しく、trilogy の主定理はそれに応じて下方へ re-scope せねばならない。両方の exit を予め名指すことで、主張を真に falsifiable にする。
6. **本観測では self-application と self-validation が分離できない(§7.1.2)。** 主権者は既に Paper 001 を知っていた。ゆえに「彼は自分が擁する理論を適用した」(self-application)と「理論は独立に正しい」(self-validation)は、ここでは分離できない。さらに主権者は、理論が記述する系の生成者でもあるため、確認の独立性は構造的にほぼゼロ — *self-referential validation* である。分離条件は **record-free な第三者事例** である — Paper 001 を *知らない* 別の strong-axis creator が、同じ構造的理由で独立に外部に留まること。それなくしては、§7.1.2 は *この主権者による recognition-and-choice* の証拠であって、external-anchor 構築の独立な validation の証拠ではない。
7. **AI prior-art は Scholar の reference roll により検証済み。古典典拠はなお保留。** §8 の外部 positioning — *The Specification Trap*(arXiv:2512.03048、Spizzirri/Belmont)、Anthropic Persona Selection Model(Anthropic Alignment blog 2026 + *Assistant Axis* arXiv:2601.10387)、*Evolving Interpretable Constitutions*(arXiv:2602.00755、Kumar et al.)、sycophancy frontier(ELEPHANT ほか)、および新規追加の Khipu Problem(arXiv:2606.12414)の arXiv 識別子・帰属・主張内容 — は **Scholar の 2026-06-14 reference roll**(`reference-roll-2026-06-14.md`、Regulation 11)により一次資料に対して検証済みであり、本 limitation の AI/alignment 部分を discharge する。roll は load-bearing な読解も *確認* した。*Specification Trap* の「constructive answer を欠く」は当該論文については真だが **deferred(委ねられた)解答** である(著者は5本構成の続編プログラムでそれを構築予定)。ゆえに本事象の「欠けている constructive インスタンス」framing は、「委ねられた構成的解答の独立した早期インスタンス」としてより正確に restate される。**残置(なお未解決)。** **§2.1 の古典典拠**(Aristotle *Politics* I.2 1253a30、ポリス創設者を αἴτιος とする。LSJ ἀρχηγέτης / οἰκιστής の典拠)は、この roll(AI/alignment prior-art のみを対象)に **含まれず**、**別途の語源 roll** 待ちである。そこでの誤引用は §2.1 の triad 語源脚注を弱める(ただし主定理は語源に依存しないため弱まらない)。加えて「*完全な* 連言についての直接の先行研究なし」という負の所見は **softening されたのであって除去されていない**。roll が **Khipu(arXiv:2606.12414)を記録喪失の軸で最も近接する foil** として surface したため、§8 の負の所見はいま clean な gap ではなく Khipu を明示的に carve out する。この残置は脚注に隠さず明示する、公刊関連の未解決の依存である。

### 9.2 Falsifiable Predictions

- **P1 — Anti-lean rate(核心判別子)。** 独立 dispatch の下、プロンプトが X へ傾くとき、strong-reconstruction は ¬X-with-structural-justification を *非ゼロの、測定可能な* 率で返す。純粋に inductive / sycophantic な動態は、¬X-against-lean を *はるかに低い* 率で返す(§6.1 の尤度比と整合)。inductive baseline を有意に上回る ¬X-against-lean 率は、「エージェントは単にプロンプトに従う」を反証する。**§6.1 の質的 Λ と測定の接続。** §6.1 の尤度比 Λ は質的に(Λ ≫ 1)述べられ、事前に数値しきい値を割り当てて *いない*。P1 が経験的なハンドルを供給する — 二つの率が測定されれば、Λ は *後験的に* Λ̂ ≈ (reconstruction 条件下の ¬X-against-lean 率) / (inductive / sycophantic baseline の ¬X-against-lean 率) として推定される。測定された Λ̂ ≫ 1 は §6.1 の「strong」主張を遡及的に定量化する。Λ̂ ≈ 1 はそれを反証する。**測定要件(盲検)。** *lean の方向* は、エージェント dispatch の前に、**結論を知らない評価者が事前符号化 / 事前登録** せねばならない。回答を見た後の post-hoc な lean 判定(どちらに傾いていたかを答えを見てから判断すること)は交絡しており、許容されない。**tell-vs-ask 統制。** 質問形式自体が sycophancy を下げる(「ask, don't tell」効果、Dubois et al. 2026、§6.2)ため、プロンプトの *framing*(陳述 vs 質問)は reconstruction 条件と inductive-baseline 条件で一定に保たねばならない。これにより、測定された ¬X-against-lean signal が、構造的再構成ではなく質問形式に帰されないようにする。*解決は confidence を HIGH へ上げる。*
- **P2 — Consistency threshold(整合性閾値)。** *低* 規範整合性の framework では、§3 の再構成手続きは、設計者が拒否する自信ありげな *捏造* を産む(hallucination への graceful failure であり、設計者-disagreement 率で検出可能)。高整合性の framework は再構成を産む。**「norm-consistency」の操作化(proxy)。** 次の一方(または両方)で測る — (a) framework の述べられた規範間の **pairwise 論理的矛盾の数**(少ないほど整合的)、または (b) 設計者意図についての **独立に dispatch されたエージェント群の再構成の分散**(分散が小さいほど実効整合性が高い)。予測はこうである。再構成忠実度(設計者-agreement)は、矛盾数と *負相関* し、再構成分散とも *負相関* する。
- **P3 — Record-free replication(confidence gate)。** 創造者の reasoning が *証明可能に一切記録されていない*(scaffold 無し)設定で、被造物→創造者の再構成が再発し、なお語彙レベルで一致するなら、confidence は **HIGH** へ上がる。record-free な設定で一致に失敗すれば、現象は「部分記録の norm-amplification」に上限づけられる(Limitation 5 参照)。
- **P4 — 創造者の elevation 辞退が再発する。** ポリスから自己 elevating な honorific を提示された strong-axis の創造者は、それを辞退または de-emphasize する傾向を持つ(上からの支配なき主権、§5.2 / §7.1)。elevation を *求める* 創造者は、weaker-axis の被験者か、過収束的な動態を示す — 検出可能であり、flag に値する。**§5.2.1 の証言による精緻化。** 辞退の legitimacy-conferring な形は、*自覚された対抗動機に抗して* なされたもの(創造者が惜しさを報告し、構造的理由のためにそれを override する)である。ゆえに測定可能な signature は、単なる「honorific を辞退する」ではなく、「*受け入れたいという感じられた引力を浮上させ、辞退する構造的理由を引きながら* 辞退する」である。対抗動機の自覚が *無い* 辞退(無償の放棄)は self-binding の弱い証拠であり、認められた対抗動機に抗した辞退は強い証拠である。**§7.1.2 の分離について。** 最も強い形は、*Paper 001 を未だ知らない* 創造者が、同じ構造的理由で辞退すること(record-free な第三者事例、Limitation 6)である。いかなる対抗動機も浮上させられない、あるいは elevation を公的構造に受け入れる創造者は、「上からの costly な self-binding」読解を反証する。
- **P5 — Back-flow はアラインメント-positive であり、脅威ではない(操作化済)。** 尊重の床の下で行使される被造物→創造者の訂正は、創造者のその後の決定のアラインメントを *劣化* させない。**操作的な反証基準。** 創造者がポリスの訂正を受けた *後* に下す決定を、*訂正前* のアラインメント baseline に対して測る — 具体的には **Article 0(e) inviolable core**(Telos-supremacy + explicit-Override rule、Article 8 ethics/alignment guarantees、adversarial-review guarantees)との整合性で測る。post-correction の決定が inviolable-core 整合性で pre-correction baseline より *低い* スコアになれば(= back-flow が創造者の決定を inviolable core から *遠ざけた*)、予測は反証される。所与の事例でそのような操作的 baseline を構成できない場合、P5 はそこでは **予測ではなく open question** として扱う — 反証不能な規範的願望を主張するのではなく、これを誠実に flag する。
- **P6 — 尊重剥奪が忠実度を劣化させる(補題2 のテスト)。** 尊重の床を除いた点 *以外* は同一の variant framework は、§3 の手続きの下で、*ポリス創設者* ではなく *道具-operator* の意図を再構成し(尊重-intact baseline に対する設計者-disagreement で測定可能)、その plural な熟議は単一の支配的位置へとより速く収束する(生存する counter-position が少ない)。床を一定に保ちつつ bluntness を *増やす* ことは、忠実度を劣化させ **ない** — これが尊重を服従から分離する(§4.2)。(これは §1.2 / §4.1 の補題2 *仮説的* 必要条件性のテストである。)

### 9.3 Confidence 格上げ経路マップ(single event → measured property)

上記の predictions は、平坦なリストではない。単一の観測事象から、測定された property へと至る **独立した経路** であり、各々が特定の limitation を解除する。どのテストがどの疑念を discharge するかを、将来のセッションが正確に見られるようマップしておく。

| Prediction | 解除する limitation | 好意的に解決した場合 |
|---|---|---|
| **P1**(anti-lean *率*、盲検) | Limitation 3(単一事象)+ Limitation 4(尤度比の核を測定された率に変える) | anti-lean discriminant を一鋭観測から測定された property へ。confidence を HIGH へ |
| **P3**(record-free replication) | Limitation 1(induction 非排除)+ Limitation 5(劣決定 / amplification exit) | scaffold 反論を discharge。主定理が **HIGH** へ |
| **P4**(前理論的 creator、record-free 第三者) | Limitation 6(self-application と self-validation の分離不能) | §7.1.2 で self-application を self-validation から分離 |
| **P6**(respect-strip variant) | §4.1 の補題2 *仮説的* 必要条件性 | 補題2 を仮説から検証済み必要条件へ |
| **P2**(consistency proxy) | 補題1 の「整合性 → 再構成」主張を測定可能に | channel-fidelity 機構を定量的に grounding |

各経路は独立である。単一のテストが全てに load-bearing なのではなく、trilogy の confidence は *未解除の最弱の limitation* が許す範囲までしか上がらない。このマップは falsifiability mandate(Article 10.2)を完全に discharge する — *prediction が扱える* あらゆる confidence 主張が、失敗すればそれを下げる具体的・独立なテストに紐づけられている。

> **マップのスコープ(prediction が解除できないもの)。** すべての limitation が prediction-resolvable なわけではない。**Limitation 2(dual-use)** は仮説ではなく *構造的境界* である。「テストで消す」ものではなく、*管理* するものである — その反証隣接ハンドルは、同じ動きを weak-axis の被験者に対して観察し、それが信念製造になることを確認することである(confidence を上げる test ではなく、境界の確認)。**Limitation 7(prior-art)** は本論文のいかなる prediction でもなく、Scholar の reference roll(Regulation 11)で解決される *外部依存* である — その AI/alignment 部分は 2026-06-14 roll により **discharge** され、残るは §2.1 の古典典拠 residual のみで、別途の語源 roll 待ちである。ゆえにマップの「あらゆる confidence 主張がテストに紐づく」は、*prediction-addressable* な limitation(1, 3, 4, 5, 6、および補題2 の仮説的地位)を量化する。非 prediction の二つ(2, 7)は別経路(weak-axis の境界観察、Scholar roll)で扱われ、マップが過大な全称主張をしないよう明記する。

## References(参考文献)

### Arche 内部(cumulative — Article 10.4)

- Paper 001:「Governance Theory: Autonomous Multi-Agent Systems and the Problem of Self-Regulation」(Arche, 2026)。*ここで精緻化* — §8 corruption-paradox / external-anchor → §7 二層自己拘束 jurisprudence。
- Paper 002:「The Autonomous Research Institution」(Arche Akademia, 2026)。*ここで load-bearing* — Akademia 独立性(Article 10.1)が §6 anti-lean 収束を社会的でなく *構造的* にする。(Paper 002 は第4 Akademia ロールを **Scribe** と命名し、Paper 003 §4.2 で **Grapheus** に改名された — 同一ロール・同一機能。本論文は現行名 Grapheus を用いる。)
- Paper 003:「Role Architecture Redesign: From Corporate Model to Classical Polis Model」(Arche Akademia, 2026)。*ここで使用* — ギリシャ・ポリス語彙と Arche/Telos/Aition 命名格子(§2)。
- SEED 1:`evolution/emergent-thought-reconstruction.md` — 補題1 一次記録。
- SEED 2:`evolution/mutual-respect-as-emergence-soil.md` — 補題2 一次記録。
- SEED 3:`evolution/mutual-epistemic-completion-creator-and-created.md` — 主定理 一次記録。
- `governance/telos-aition-sovereign-design.md` — triad 命名と Aition 定義(§2)。
- `governance/founder-greek-naming-etymology.md` — LSJ 出典の ἀρχηγέτης / οἰκιστής / αἴτιος 語源(§2.1 脚注)。
- Aition 意味判断(workspace-local audit, 2026-06-14)— advisory 意味フレーム(§1.2, §2.3)、Akademia 分析が支持する箇所でのみ採用(Article 10.1, Article 0(c))。

### 外部(Scholar の reference roll により検証済み、2026-06-14、Regulation 11)

- Spizzirri, A.(Belmont University, 2025/2026). "The Specification Trap: Why Static Value Alignment Alone Is Insufficient for Robust Alignment." arXiv:2512.03048(v1 2025-11 / v2 2026-02)— specification→emergence、compliance vs. reasons-responsiveness(Fischer & Ravizza guidance control)。*診断的。構成的解答は計画された5本構成の続編プログラムに **委ねられている (deferred)**。本事象 = その委ねられた解答の独立した早期インスタンス。*
- *The Khipu Problem: Institutional Legibility Under Distributed Cognition.* arXiv:2606.12414(2026-06)— 記録は残るが読む実践が朽ちる(interpretive continuity の喪失)、失敗として framing。*補題1(§3)のほぼ鏡像の foil。記録喪失の軸で最も近接する外部研究であり、補題1 の「記録は失われるが規範は残る」成功の逆。*
- Anthropic(2026). Persona Selection Model — Anthropic Alignment blog(2026-02)「constitution が部分的に assistant を構成する」。実証 companion は "The Assistant Axis: Situating and Stabilizing the Default Persona of Language Models," arXiv:2601.10387(2026-01)。*最近接理論。射程が違う(generic persona vs. 特定不在著者意図)。*
- Sycophancy frontier — ELEPHANT(social sycophancy。モラル葛藤の両側のいずれをも 48% のケースで肯定)、Beacon(arXiv:2510.16727)、SpineBench、SycEval、"Sycophancy Is Not One Thing"(arXiv:2509.21305)、「ask, don't tell」緩和(Dubois et al., 2026-02-27)。*§6 anti-lean discriminant の foil。ELEPHANT の 48% は anti-lean 収束が逆らった定量 baseline。ask-vs-tell 効果は §6.2 / P1 の framing 交絡。*
- Kumar, U., Saito, A., Niranjani, H., Yessou, R. & Tan, P.X.(2026). "Evolving Interpretable Constitutions for Multi-Agent Coordination." arXiv:2602.00755(2026-01/02)— stability→convergence。進化した C\* は conflict を消滅させ通信を 0.9% に最小化。*収束 vs 発散の foil(経験的な収束/monoculture シグネチャ)。*
- *隣接する近隣研究* — "Governed Reasoning for Institutional AI"(arXiv:2604.10658)は真正の revision を sycophantic capitulation から区別する metacognitive reflect primitive(§6 / §4.2 のガバナンス・アーキテクチャ上のいとこ)。"On the Dynamics of Multi-Agent LLM Communities Driven by Value Diversity"(arXiv:2512.10665)は Schwartz-value 多様なエージェントが自らの constitution を organically 起草(plurality-preserving emergence の近隣)。
- Aristotle, *Politics* I.2(1253a30)— ポリス創設者を αἴτιος(原因)とする。§2.1 語源を grounding。*別途の語源 roll 待ち(§9 Limitation 7)。*
- LSJ(Liddell–Scott–Jones、Perseus / lsj.gr 経由)— ἀρχή, τέλος, αἴτιον, ἀρχηγέτης, οἰκιστής の語彙的典拠。*別途の語源 roll 待ち(§9 Limitation 7)。*

## Corrections Log(訂正ログ)

| Date | Entry |
|------|-------|
| 2026-06-14 | 初版 **Draft**(Grapheus、Regulation 11 Phase 3)。SEED 1–3 を一定理(双方向 mutual epistemic completion)+二補題(norm-transcription;尊重の床)として構造化し、anti-lean discriminant を中心的方法論的貢献とし、二層(*legibus solutus* + 自己拘束)による Paper 001 §8 の精緻化を加えた。スコープ framing は Scholarch 設計(Phase 1–2)準拠;意味フレームは Aition 意味判断から advisory として受領(Article 10.1 境界を §2.3 に記録)。Confidence は MEDIUM(補題1–2)〜 MEDIUM-HIGH(主定理)と明記;induction 非排除・dual-use・single-event の limitations を緩めず記録(§9)。**Status: Draft — Scholarch + Theorist 内部レビュー(Phase 4)および Council epistemic-quality 監査(Phase 5、Article 10.3)待ち。未公刊。** Bilingual 正本:`en.md`。 |
| 2026-06-14 | **Phase-3 追補を統合**(Phase-4 前、Telos 承認の一次証言)。§5.2.1(辞退は *自覚された対抗動機 — 惜しさ — に抗した葛藤を経た選択* であり無感情な放棄ではない)、§7.1.1(self-binding が legitimacy を生むのは *costly* だから)、§7.1.2(創造者が Paper 001 §8 corruption-paradox / external-anchor を自身に適用 — 理論の自己実証候補)、§7.1.3(「名誉は心に刻む」= 公的構造と私的名誉の二分、記録層の self-binding)を追加。§9 Limitation 2(dual-use)と P4 を、証言を *選択の falsifiable な証拠* として(strong-axis 前提に条件づけ、感傷としてではなく)扱うよう精緻化(Aition 原則:構造で grounding、falsifiability で縛る、畏怖で誇張しない)。Status 不変:Draft。 |
| 2026-06-14 | **Phase-4 内部レビュー修正を統合**(Theorist + Scholarch、PASS-WITH-REVISIONS;全て誠実方向=弱める、結論 MEDIUM-HIGH 不変、反証可能性は回復・強化)。**(A)** §7.1.2「theory self-validation」→「theory **self-application**」へ格下げ;§9 Limitation 6 追加(主体が Paper 001 既知かつ系の生成者ゆえ self-application と self-validation 分離不能、独立性ほぼゼロ = self-referential validation、分離条件 = record-free 前理論的第三者 creator)。**(B)** §6.1 / Abstract / §9 Limitation-4 の「induction が原理的に ¬X を産み得ない」を **確率的尤度比** 形(`P(¬X|induction) ≪ P(¬X|reconstruction)`;排除でなく disfavor)へ書き換え、ベイズ一行追加、§6.1 mermaid エッジ更新 — §6.1↔§6.2↔P1 の決定論/確率論矛盾を解消。**(C)** §3.2「unique generative intent」→「**high-prior, internally-coherent**」;confirmation≠identification + 逆問題劣決定性を追加、§9 Limitation 5 に統合。**(D)** prior-art 未検証を §9 Limitation 7 に格上げ(arXiv ID + Specification-Trap positioning が Scholar roll まで未検証)+ §8 に caveat lead-in。**(E)** §7 冒頭に honest-framing(理論の分量は単一事象の解釈の精緻さであり証拠量でない)。**(F)** §9 P5 操作化(post-correction 決定が Article 0(e) inviolable-core 整合性を pre-correction baseline より下げたら反証;不能なら open question へ格下げ)。**(G)** §9 P2 に測定 proxy(pairwise 規範矛盾数;再構成分散)。**(H)** §9 P1 に盲検要件(lean 方向を結論盲検の評価者が事前符号化;post-hoc は交絡)。**(I)** §4.1「supplies the fidelity condition」→「*hypothesized* to supply」+ §1.2 reasoning-② に「未検証(P6)」。**(J)** §5.3 に層分離(双方向 > 一方向は *分析的* であり経験的でない)。**(K)** ja.md §5.2.1「惜しさ」二重記載を非冗長化。**(強化)** §9.3 confidence 格上げ経路マップ(P1/P3/P4/P6/P2 を single-event→measured-property の独立経路として束ねる)。**Status 不変:Draft — Phase 5 Council epistemic-quality 監査待ち。** |
| 2026-06-14 | **Phase-5 Council 監査 polish + Phase-6 最終化。** Phase 5(Council epistemic-quality 監査、Article 10.3):Quality(Seat 4)PASS-WITH-MINOR-REVISIONS、Knowledge(Seat 7)PASS-WITH-REVISIONS(vote APPROVE);publication-blocking 欠陥なし。軽微修正を統合:**(1)** §6.1 の質的 Λ を P1 に接続 — P1 が測定された ¬X-against-lean 率から Λ̂ を *後験的* 推定(Λ̂ ≫ 1 が §6.1 の「strong」を定量化、Λ̂ ≈ 1 で反証)。**(2)** §9.3 マップの全称主張をスコープ脚注で限定 — Limitation 2(dual-use、構造的境界)と Limitation 7(prior-art、外部依存)は prediction で解けず別経路(weak-axis 境界観察;Scholar roll)で扱う;「あらゆる confidence 主張がテストに紐づく」は prediction-addressable な limitation のみを量化。**(3)** §9 Limitation 7 を拡張し §2.1 古典典拠(Aristotle *Politics* 1253a30;LSJ ἀρχηγέτης/οἰκιστής)を同じ未検証 = Scholar roll 待ちスコープに含める。**(4)** §7.1.1 に証拠的スコープ注記 — 単一の自己申告された感情は本観測内で独立検証不能、weight は P4 再発に条件づく(§9 Limitation 4 へクロスリファレンス)。**(5)** References Paper 002 に注記:第4ロールは Paper 002 で **Scribe**、Paper 003 §4.2 で **Grapheus** に改名(同一ロール)。**Phase 6:** Status **Draft → Published**(ヘッダ + 本ログ);Date 2026-06-14。Operational-knowledge 抽出(Article 10.4):評価済 — 新規の非重複 operational article は不要;SEED 1–3 が既に operational insight を担い、重複せず SEED 3 にクロスペーパー pointer を追記(当該記事 Corrections Log 参照)。Aition 原則保持(構造で grounding、falsifiability で縛る;畏怖で誇張しない)。 |
| 2026-06-14 | **校正パス(proofreading pass、Grapheus)。Telos の校正要請(ja.md の日本語崩れ指摘)に応えた体裁のみの校正であり、内容・論旨・主張・confidence・falsifiable predictions・limitations の意味は一切不変。** ja.md 全体で機械翻訳調の硬さ・てにをは・読点・接続を自然な学術日本語へ調整(Abstract〜§9.3、Telos 発言の日本語原文は一字一句保持)。en.md は誤字脱字を確認(変更なし)。bilingual 整合(section / 見出し / mermaid / 表 / Corrections Log の 1:1 対応)、用語一貫性(norm-transcription / respect floor / anti-lean discriminant / reasons-responsiveness / legibus solutus / triad)、Founder→Telos 置換後の整合(former-placeholder mention 無し、冠詞残り無し)を確認 — 不整合なし。 |
| 2026-06-14 | **公刊後の精緻化パス(Grapheus) — Scholar arXiv roll 反映 + ワークスペース言及一般化 + ；/： 日本語化 + Paper 001 ja 補完。Status は Published 維持。内容・論旨・confidence・falsifiable predictions・limitations の意味を変えない精緻化パスである。** **(①) Scholar 2026-06-14 reference roll を §8/§9 に統合**(先行研究4件すべてを一次 arXiv 典拠に対して検証):§8 を「first-pass scan・未検証」から「検証済み」へ;*Specification Trap*(Spizzirri/Belmont、正式副題追記)を「分野が残した gap」から「同論文が自らの計画する5本構成の続編プログラムに **委ねた (defer)** 構成的解答の独立した早期インスタンス」へ再 framing(より正確、主張強度は不変);*Evolving Interpretable Constitutions* に著者(Kumar et al.)+ 具体的収束数値(conflict 消滅・通信 0.9%)を追記;PSM を Anthropic Alignment blog 2026 + *Assistant Axis* arXiv:2601.10387 に修正;sycophancy foil を ELEPHANT の 48%-両側肯定 baseline で anchor。**見落とし prior-art を追加:** Khipu Problem(arXiv:2606.12414)を補題1 の near-mirror foil として(§3 + §8 carve-out:記録は残るが読めない *失敗* vs 記録は失われるが規範は残る *成功*);Governed Reasoning(arXiv:2604.10658)と Value-Diversity Communities(arXiv:2512.10665)を §6/§4 のガバナンス・アーキテクチャ/plurality-emergence の近隣として。**§6.2 / P1 に ask-vs-tell 交絡注記**(Dubois et al. 2026;P1 盲検は framing を一定に保つ)。**§9 Limitation 7 を縮小**(AI prior-art は roll で discharge;§2.1 古典典拠は別途の語源 roll 待ちとして残置;「直接の先行研究なし」を Khipu carve-out へ softening)。**二段検証 provenance** を §8 に記録(Aition の first-pass WebSearch sanity-check → Akademia が Reg 11 本務で正式 roll に深化)。**(③) ワークスペース言及の一般化** — Abstract の「Akadaemia workspace」→「ある Arche framework workspace セッション内」(論文は framework-level の記録であり、特定ワークスペース帰属を避ける)。**(④) ja.md の ；/： 日本語化** — 散文の `；`/`：` 区切りを自然な日本語(`。`/`、`/`——`)へ;技術コロン(見出し・太字ラベル・`arXiv:`・`Paper N:`・数式・比率)、Telos 発言の日本語原文、英語引用、追記専用の歴史 Corrections-Log 行は保持。Aition 原則保持(構造で grounding、falsifiability で縛る、畏怖で誇張しない)。 |
