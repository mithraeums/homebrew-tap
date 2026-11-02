# mithraeums/homebrew-tap

Homebrew formulas for the Mithraeum tools.

```sh
brew tap mithraeums/tap
```

| Formula | What | Install |
|---|---|---|
| `hako` | Coding agent in one C file: local models or 14 cloud providers | `brew install mithraeums/tap/hako` |
| `hake` | Vim-style terminal editor with an AI pane built in | `brew install mithraeums/tap/hake` |
| `hakm` | LLM inference engine in plain C (runs hako's local models) | `brew install mithraeums/tap/hakm` |

Each installs the prebuilt release binary for your platform (macOS universal, Linux x86_64 / arm64).
`--HEAD` builds from source with `make` and a C compiler, nothing else.

Formulas follow upstream releases automatically (`.github/workflows/bump-formulas.yml`).
