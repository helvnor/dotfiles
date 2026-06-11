# Dotfiles

Personal configuration files managed with symlinks via `make`.

## Tools

| Tool                | Description                                                             |
| ------------------- | ----------------------------------------------------------------------- |
| [Fish](fish/)       | Shell — Everforest Dark Hard, vi-mode, custom prompt                    |
| [Ghostty](ghostty/) | Terminal emulator — Everforest Dark Hard, transparent background        |
| [Neovim](nvim/)     | Primary editor — lazy.nvim, LSP, ~30 plugins                            |
| [Tmux](tmux/)       | Terminal multiplexer — Everforest Dark Hard colors, pane sync indicator |
| [Vim](vim/)         | Lightweight fallback editor — no plugins required                       |

## Prerequisites

- `fish`, `nvim`, `tmux`, `ghostty` installed and on `$PATH`
- `eza` and `fzf` for the `fcd` fuzzy directory jump in Fish
- NixOS/Nix: the configs reference `/run/current-system/sw/bin/fish` as the default shell in both Ghostty and Tmux; adjust if not on NixOS

## Installation

```sh
git clone <repo> ~/.dotfiles
cd ~/.dotfiles
make setup      # creates symlinks, backs up existing configs
make unlink     # removes all symlinks
```

Each tool is set up independently. `make setup` will back up any existing config to `*_bak` before linking.

---

## Fish

Config: `fish/config.fish`
Linked to: `~/.config/fish`

- **Theme**: Everforest Dark Hard color palette set directly via `fish_color_*` variables
- **Vi-mode**: enabled via `fish_vi_key_bindings`
- **Left prompt**: CWD with deterministic per-directory color (derived from `cksum` of the physical path), host prefix only on SSH/containers
- **Right prompt**: virtualenv name, command duration (shown when > 100 ms), git status, current time
- **`fcd`**: fuzzy `cd` using `fzf` + `eza --tree` preview across all directories under `$HOME`
- **Aliases**: `rm` → `trash`, `k` → `kubectl`, `kn` abbr for `kubectl config set-context --current --namespace`

---

## Ghostty

Config: `ghostty/config`
Linked to: `~/.config/ghostty`

- **Theme**: Everforest Dark Hard
- **Background**: 95% opacity, blur radius 20
- **Shell**: Fish (`/run/current-system/sw/bin/fish`)
- **UI**: no titlebar, tabs hidden, window title set to `ghostty`
- **Keybinds**: `Super+C` / `Super+V` for clipboard copy/paste

---

## Neovim

Config: `nvim/`
Linked to: `~/.config/nvim`

- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim), ~30 plugins
- **Minimal mode**: auto-detected over SSH (`$SSH_CONNECTION`) or forced with `NVIM_MINIMAL=1` — loads a reduced plugin set
- **LSP**: configured for ~18 languages via `nvim-lspconfig`
- **Completion**: `nvim-cmp` with LSP, buffer, path, and snippet sources
- **Navigation**: Harpoon for quick file marks, Telescope for fuzzy finding
- **Notes**: Obsidian.nvim for markdown/wiki editing
- **Colorscheme**: Everforest Dark Hard

---

## Tmux

Config: `tmux/dot_tmux.conf`
Linked to: `~/.tmux.conf`

- **Prefix**: `C-a` (replaces default `C-b`)
- **Vi-mode**: copy mode uses vi keys
- **Pane navigation**: `prefix + h/j/k/l`
- **Pane splits**: `prefix + s` (horizontal), `prefix + v` (vertical)
- **Window select**: `F1`–`F12` select windows 1–12 directly
- **Sync indicator**: `prefix + y` toggles pane synchronization; active border turns red (`#e67e80`) when synced, green (`#a7c080`) when not
- **Colors**: Everforest Dark Hard hex values throughout
- **Status bar**: top-positioned, shows user@host and date/time on the right

---

## Vim

Config: `vim/dot_vimrc`
Linked to: `~/.vimrc`

No plugin manager — works out of the box with any Vim installation.

- 4-space tabs, `expandtab`
- Relative line numbers
- Persistent undo (`~/.vim/undo`)
- Spell check (`en_gb`) auto-enabled for `markdown` and `text` files
- `C-h/j/k/l` for window navigation, `Space` as leader
- Colorscheme: `slate` (built-in)
