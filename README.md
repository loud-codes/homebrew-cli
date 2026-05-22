<div align="center">

```
                ██╗      ██████╗ ██╗   ██╗██████╗
                ██║     ██╔═══██╗██║   ██║██╔══██╗
                ██║     ██║   ██║██║   ██║██║  ██║
                ██║     ██║   ██║██║   ██║██║  ██║
                ███████╗╚██████╔╝╚██████╔╝██████╔╝
                ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝
```

### **Homebrew tap for [LOUD](https://loud.codes)**

Terminal-first AI agent · self-hosted · cross-platform.

[![Tap](https://img.shields.io/badge/brew%20tap-loud--codes%2Fcli-a2cd65?style=flat-square&logo=homebrew&logoColor=white)](https://github.com/loud-codes/homebrew-cli)
[![Formula](https://img.shields.io/badge/formula-loud%200.3.0-a2cd65?style=flat-square)](Formula/loud.rb)
[![macOS](https://img.shields.io/badge/macOS-supported-a2cd65?style=flat-square)](#)
[![Source](https://img.shields.io/badge/source-loud--cli-a2cd65?style=flat-square&logo=github&logoColor=white)](https://github.com/loud-codes/loud-cli)

</div>

---

## Install

```bash
brew tap loud-codes/cli
brew install loud
```

After install:

```bash
loud login       # use your loud.codes username + password
loud             # interactive REPL
loud --version
```

> LOUD is **invite-only** while in private beta. Request access at [loud.codes](https://loud.codes).

---

## What's in this tap

| Formula | Description |
|---|---|
| **`loud`** | LOUD CLI — terminal-first AI agent that connects to your private LOUD server. |

---

## Update

```bash
brew update
brew upgrade loud
```

Or use the CLI's built-in self-update (works on every install method):

```bash
loud update
```

---

## Uninstall

```bash
brew uninstall loud
brew untap loud-codes/cli
rm -rf ~/.loud
```

---

## Other ways to install

| OS | Command |
|---|---|
| **macOS · Linux** | `curl -fsSL https://loud.codes/install.sh \| bash` |
| **macOS (this tap)** | `brew tap loud-codes/cli && brew install loud` |
| **Windows** | `iwr -useb https://loud.codes/install.ps1 \| iex` |
| **Source** | clone [loud-codes/loud-cli](https://github.com/loud-codes/loud-cli) |

---

<div align="center">

[loud.codes](https://loud.codes) · MIT license · invite-only beta

</div>
