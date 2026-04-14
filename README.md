# Karpathy-Inspired Hermes-Agent Skills

A Hermes-Agent-first skills repo that packages Andrej Karpathy-inspired coding guidelines as reusable Hermes-Agent skills and portable agent instruction docs.

These guidelines are derived from Andrej Karpathy's observations on common LLM coding failures:
- hidden assumptions
- overcomplicated implementations
- drive-by edits outside task scope
- weak success criteria that prevent reliable autonomous loops

This repo is now explicitly Hermes-Agent-first.
The canonical artifacts are:
- Hermes-Agent skill packages under `skills/`
- a portable `HERMES.md` instruction file
- Hermes-Agent install/use docs

## What you get

- `skills/karpathy-guidelines/SKILL.md`
  - reusable Hermes-Agent skill you can install locally and load on demand
- `HERMES.md`
  - portable instruction doc for projects that want a direct instruction file
- `EXAMPLES.md`
  - concrete before/after examples showing the four principles in practice
- `scripts/install-hermes-skill.sh`
  - helper script to install the skill into `~/.hermes/skills/`

## The four principles

| Principle | Fixes |
|-----------|-------|
| Think Before Coding | hidden assumptions, silent confusion, missing tradeoffs |
| Simplicity First | overengineering, speculative abstractions, bloated APIs |
| Surgical Changes | unrelated edits, accidental refactors, collateral damage |
| Goal-Driven Execution | vague tasks, weak verification, bad autonomous loops |

## Install for Hermes-Agent

### Option A: install the local skill into Hermes

```bash
git clone https://github.com/dax8it/andrej-karpathy-skills.git
cd andrej-karpathy-skills
./scripts/install-hermes-skill.sh
```

That installs the skill into:
- `~/.hermes/skills/karpathy-guidelines/`

Then use it in Hermes-Agent:

```bash
hermes -s karpathy-guidelines
```

Or inside a running Hermes-Agent session:

```text
/skill karpathy-guidelines
```

### Option B: install manually

```bash
git clone https://github.com/dax8it/andrej-karpathy-skills.git
mkdir -p ~/.hermes/skills/karpathy-guidelines
cp -R andrej-karpathy-skills/skills/karpathy-guidelines/* ~/.hermes/skills/karpathy-guidelines/
```

### Option C: use the portable instruction file

If you want a repo-local instruction document instead of a Hermes-Agent skill install:

```bash
curl -o HERMES.md https://raw.githubusercontent.com/dax8it/andrej-karpathy-skills/main/HERMES.md
```

Then merge it into your project’s own Hermes-Agent operating instructions as needed.

## Why this works well with Hermes-Agent

Hermes-Agent is strongest when it has:
- clear success criteria
- reusable operating procedures
- bounded changes
- explicit verification loops

These guidelines fit that operating model directly:
- they reduce hallucinated assumptions before tool use
- they bias toward minimal diffs and cleaner PRs
- they turn vague requests into verifiable goals Hermes-Agent can loop on
- they make it easier to save and reuse disciplined workflows as skills

## How to know it is working

You should see:
- fewer unnecessary lines changed per task
- fewer speculative abstractions
- more clarifying questions before implementation mistakes
- cleaner, smaller diffs
- more test-backed completion instead of optimistic narration

## Repo layout

```text
andrej-karpathy-skills/
├── HERMES.md
├── README.md
├── EXAMPLES.md
├── scripts/
│   └── install-hermes-skill.sh
└── skills/
    └── karpathy-guidelines/
        └── SKILL.md
```

## Suggested usage pattern

Use `karpathy-guidelines` when:
- implementing a non-trivial feature
- debugging a bug that could invite cargo-cult fixes
- reviewing diffs for scope creep
- asking Hermes-Agent to work autonomously over multiple steps

Good pairing skills in Hermes-Agent:
- `test-driven-development`
- `systematic-debugging`
- `writing-plans`
- `requesting-code-review`

## License

MIT
