# Energy-B Roadmap 开发路线图

**[中文](#中文) | [English](#english)**

> 本路线图是**草稿**,由作者持续更新。标注 🔒 的部分属于核心设定,由作者主导;标注 🙌 的部分欢迎社区认领。认领前请先阅读 [CONTRIBUTING.md](CONTRIBUTING.md),并在 Issues 中提案、获得作者批准。
>
> This roadmap is a **living draft**, updated by the author. Items marked 🔒 are core design, led by the author; items marked 🙌 are open for community contributions. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and get the author's approval via an Issue before starting.

---

<a id="中文"></a>

## 中文

### 当前状态(阶段 0:框架)

已有内容(基于当前仓库文件):

- ✅ Godot 项目框架(`project.godot`)
- ✅ 主场景(`Main.tscn` / `Main.gd`)
- ✅ 能量钱包(`EnergyWallet.tscn` / `EnergyWallet.gd`)
- ✅ 转账弹窗(`TransferPopup.tscn` / `TransferPopup.gd`)
- ✅ 项目思路与整体走向(作者掌握)

### 主线阶段 🔒

以下阶段与走向由作者决定,具体细节与玩法欢迎在批准后协作设计。

| 阶段 | 主题 | 说明 |
|---|---|---|
| 1 | **地球 · 能量币发起** | 能量币的产生、发起与试点,玩家从小范围社群开始 |
| 2 | **地球 · 取代纸币** | 能量币被社会逐步接纳,最终完全取代纸币,社会生活细节随之改变 |
| 3 | **月球** | 人类迁往月球,以 EB 交换生产资料,建立月球社群 |
| 4 | **火星** | 火星殖民与星球环境改变,EB 继续作为唯一主线 |
| 5 | **更多新星球** | 一步步探索新星球,逐关推进 |

### 核心系统(待开发)

| 系统 | 内容 | 负责 |
|---|---|---|
| 能量币规则 | 产生、流通、兑换、取代纸币的规则 | 🔒 作者 |
| 钱包与转账 | 余额、转账、交易记录 | 🙌 可协作(规则以作者为准) |
| 社会生活模拟 | 工作、消费、交往、社群 | 🙌 提案后协作 |
| 星球与环境 | 星球改变、资源与生产资料交换 | 🙌 提案后协作 |
| 存档与读档 | 保存游戏进度 | 🙌 欢迎认领 |

### 🙌 欢迎帮忙的方向

**新手友好(`good first issue`)**
- 修正文档错别字、完善 README
- 翻译(中 / 英 / 其他语言)
- 测试游戏并反馈 Bug
- 整理项目目录结构(如把脚本和场景分到不同文件夹)

**程序**
- 钱包与转账功能完善、交易记录
- UI 界面优化
- 存档系统
- 代码注释与重构

**美术与声音**
- 界面图标、能量币图案
- 地球 / 月球 / 火星场景概念图
- 音效与背景音乐(请注明版权来源)

**策划与文案**
- 各阶段社会生活的细节设想(以 Issue 提案)
- 游戏内文本、事件、剧情

### 参与方式

1. 在 [Issues](../../issues) 查看或创建任务
2. 带 `已批准` 标签的任务可以直接开始
3. 新思路先提 `[提案]`,等待作者回复
4. Fork → 开发 → Pull Request

---

<a id="english"></a>

## English

### Current Status (Phase 0: Framework)

Already in the repo:

- ✅ Godot project skeleton (`project.godot`)
- ✅ Main scene (`Main.tscn` / `Main.gd`)
- ✅ Energy wallet (`EnergyWallet.tscn` / `EnergyWallet.gd`)
- ✅ Transfer popup (`TransferPopup.tscn` / `TransferPopup.gd`)
- ✅ Concept and overall direction (held by the author)

### Main Storyline Stages 🔒

The stages and direction are decided by the author. Details and gameplay can be co-designed once approved.

| Stage | Theme | Description |
|---|---|---|
| 1 | **Earth: Launching Energy Coin** | Creation, launch and pilot of EB; the player starts in a small community |
| 2 | **Earth: Replacing Paper Money** | EB gains acceptance and fully replaces paper money, changing daily life |
| 3 | **The Moon** | Humans move to the Moon, trade EB for production resources, build lunar communities |
| 4 | **Mars** | Martian colonization and planetary change, with EB as the single main thread |
| 5 | **More New Worlds** | Exploring new planets, level by level |

### Core Systems (To Do)

| System | Scope | Owner |
|---|---|---|
| Energy Coin rules | Creation, circulation, exchange, replacing paper money | 🔒 Author |
| Wallet & transfers | Balance, transfers, transaction history | 🙌 Collaborative (rules per author) |
| Social life simulation | Work, consumption, relationships, communities | 🙌 After proposal |
| Planets & environment | Planetary change, resource exchange | 🙌 After proposal |
| Save / load | Saving game progress | 🙌 Open to claim |

### 🙌 Where We Need Help

**Beginner-friendly (`good first issue`)**
- Fix typos, improve README
- Translation (Chinese / English / other languages)
- Playtesting and bug reports
- Tidy up the project structure (e.g. separate scripts and scenes into folders)

**Programming**
- Improve wallet and transfer features, transaction history
- UI polish
- Save system
- Code comments and refactoring

**Art & Audio**
- UI icons, Energy Coin artwork
- Concept art for Earth / Moon / Mars scenes
- Sound effects and music (please credit sources)

**Design & Writing**
- Ideas for social-life details at each stage (propose via Issue)
- In-game text, events, story

### How to Join

1. Browse or create tasks in [Issues](../../issues)
2. Tasks labeled `approved` can be started right away
3. New ideas: open a `[Proposal]` first and wait for the author's reply
4. Fork → develop → Pull Request
