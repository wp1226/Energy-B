# Contributing to Energy-B 参与贡献指南

**[中文](#中文) | [English](#english)**

---

<a id="中文"></a>

## 欢迎!

感谢你对 **Energy-B(能量币 / 易币)** 感兴趣!这是一个由作者发起的开放世界社会模拟游戏,我们欢迎各类爱好者共同完善它。

为了让项目始终沿着统一的愿景前进,本项目采用 **"作者主导 + 社区共建"** 的模式。请在贡献前认真阅读本文档。

## 一、核心原则

1. **作者拥有最终决定权。** 核心设定、世界观与主线走向由作者(维护者)决定。
2. **先沟通,后开发。** 开发新模块、加入新思路、修改现有设定,都必须先提 Issue,**经作者明确同意后**才能开始。
3. **未经批准的大改动可能不会被合并**,请避免白费功夫。
4. **尊重彼此。** 友善交流,对事不对人。

## 二、受作者保护的"核心设定"

以下内容属于**核心设定**,任何修改、扩展或重新诠释,都必须事先获得作者批准:

- **能量币(EB / 易币)作为贯穿全游戏的唯一主线**:从地球、月球、火星到其他新星球,人类始终使用能量币
- 能量币的**产生、发起、演化,直至完全取代纸币**的整体进程与规则
- **以 EB 交换生产资料**的星际经济基本逻辑
- 游戏整体**阶段划分与闯关走向**(地球 → 月球 → 火星 → 更多星球)
- 游戏的**世界观、名称、核心理念**

> 提示:你可以在核心设定之内,自由设计细节、玩法、美术、剧情分支等,但前提是不违背上述主线。有疑问时,先问。

## 三、哪些贡献受欢迎?

- 🐛 修复 Bug
- ✨ 在已批准的路线图内开发功能
- 🎨 美术、UI、音效、音乐
- 📝 文案、剧情、翻译、文档
- 🧪 测试与反馈
- 💡 新点子(请先通过 Issue 讨论)

## 四、贡献流程

### 1. 小改动(修 Bug、改错别字、完善文档)
可直接 Fork → 修改 → 提交 Pull Request。

### 2. 新功能 / 新模块 / 新思路(必须先获批)

1. **提交 Issue**,标题加前缀 `[提案]`,内容包括:
   - 你想做什么
   - 为什么对游戏有益
   - 与能量币主线的关系
   - 大致实现思路与预计工作量
2. **等待作者回复。** 作者会用标签标记:
   - `已批准`:可以开始开发
   - `讨论中`:需要进一步沟通
   - `暂不考虑`:目前不纳入计划
3. **获批后再开发。** 在 Issue 中说明你已认领,避免与他人重复。
4. **Fork 仓库**,新建分支(如 `feature/xxx`、`fix/xxx`)。
5. **提交 Pull Request**,并在描述中关联对应 Issue(如 `Closes #12`)。
6. **等待审核。** 作者可能提出修改意见。通过后由作者合并。

### 3. Pull Request 要求

- 一个 PR 只做一件事
- 代码风格与现有项目保持一致
- 写清楚改了什么、为什么改
- 自测通过后再提交
- 不要提交密码、密钥、个人隐私信息

## 五、分支与合并规则

- `main` 分支受保护,**不允许直接推送**
- 所有改动必须通过 Pull Request,并经作者审核
- 核心文件由 `CODEOWNERS` 指定作者审核

## 六、版权与授权

- 提交 Pull Request 即表示:你确认这是你自己的原创作品(或已获授权),并同意以本项目所选许可证授权给项目使用。
- 请勿提交他人有版权的素材(图片、音乐、字体、代码等),除非许可证允许并已注明来源。
- 核心设定与世界观的版权归原作者所有。

## 七、联系方式

- 提问与讨论:GitHub Issues / Discussions
- 交流群:`请填写 QQ群 / 微信群 / Discord`
- 邮箱:`请填写`

再次感谢你的加入,让我们一起把"能量币"的未来做出来! 🚀

---

<a id="english"></a>

## Welcome!

Thank you for your interest in **Energy-B (能量币 / 易币)**! This is an open-world social simulation game started by its author, and we welcome enthusiasts of all kinds to help complete it.

To keep the project aligned with a single vision, we follow an **"author-led, community-built"** model. Please read this document before contributing.

## 1. Core Principles

1. **The author has the final say.** The core design, worldview, and main storyline are decided by the author (maintainer).
2. **Discuss first, build later.** Before developing a new module, adding a new idea, or changing existing design, you must open an Issue and **receive the author's explicit approval**.
3. **Unapproved large changes may not be merged.** Please avoid wasted effort.
4. **Be respectful.** Communicate kindly and focus on ideas, not people.

## 2. Protected Core Design

The following are **core design elements**. Any change, extension, or reinterpretation requires prior approval from the author:

- **Energy Coin (EB / 易币) as the single main thread** of the entire game: from Earth to the Moon, Mars, and further worlds, humanity always uses Energy Coin
- The overall progression and rules of EB: **its creation, launch, evolution, and full replacement of paper money**
- The basic logic of the interplanetary economy: **exchanging EB for production resources**
- The overall **stage structure and progression** (Earth → Moon → Mars → more planets)
- The game's **worldview, name, and core concept**

> Tip: Within the core design, you are free to craft details, gameplay, art, story branches, and more, as long as they don't contradict the main thread. When in doubt, ask first.

## 3. Welcome Contributions

- 🐛 Bug fixes
- ✨ Features within the approved roadmap
- 🎨 Art, UI, sound, music
- 📝 Writing, story, translation, documentation
- 🧪 Testing and feedback
- 💡 New ideas (discuss via Issue first)

## 4. Contribution Workflow

### 1. Small changes (bug fixes, typos, docs)
Fork → edit → open a Pull Request directly.

### 2. New features / modules / ideas (approval required)

1. **Open an Issue** with the prefix `[Proposal]`, including:
   - What you want to build
   - Why it benefits the game
   - How it relates to the Energy Coin main thread
   - Rough implementation plan and estimated effort
2. **Wait for the author's reply.** The author will label it:
   - `approved`: you may start
   - `discussing`: more conversation needed
   - `not-planned`: not part of current plans
3. **Develop only after approval.** Comment on the Issue to claim it and avoid duplicate work.
4. **Fork the repo** and create a branch (e.g. `feature/xxx`, `fix/xxx`).
5. **Open a Pull Request** linked to the Issue (e.g. `Closes #12`).
6. **Await review.** The author may request changes. Once approved, the author merges it.

### 3. Pull Request Requirements

- One PR, one purpose
- Match the existing code style
- Clearly describe what changed and why
- Test before submitting
- Never commit passwords, keys, or private information

## 5. Branch & Merge Rules

- The `main` branch is protected: **no direct pushes**
- All changes go through Pull Requests reviewed by the author
- Core files are assigned to the author via `CODEOWNERS`

## 6. Copyright & Licensing

- By submitting a Pull Request, you confirm the work is your own (or properly licensed) and agree to license it under the project's chosen license.
- Do not submit copyrighted third-party assets (images, music, fonts, code, etc.) unless the license permits it and the source is credited.
- Copyright of the core design and worldview belongs to the original author.

## 7. Contact

- Questions & discussion: GitHub Issues / Discussions
- Community: `QQ group / WeChat / Discord, please fill in`
- Email: `please fill in`

Thanks again for joining. Let's build the future of Energy Coin together! 🚀
