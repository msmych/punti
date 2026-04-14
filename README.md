# Punti

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package that mirrors the target file structure under `$HOME`.

## Prerequisites

* [Homebrew](https://brew.sh/)
* See `brew.sh` script

## Usage

```sh
cd punti
stow <package>          # symlink a package into ~
stow --restow <package> # re-symlink (useful after changes)
stow -D <package>       # unlink a package
```

## Packages

### [ghostty](https://ghostty.org/)

Terminal emulator config (`~/.config/ghostty/config`).

- Hack Nerd Font Mono 14pt, font thickening, contextual alternates disabled
- Rose Pine Moon theme
- Transparent titlebar, maximized window, padding 4
- Copy-on-select, hide mouse while typing, Option as Alt

### [alacritty](https://alacritty.org/)

Terminal emulator config (`~/.config/alacritty/alacritty.toml`).

- Hack Nerd Font Mono 14pt
- Rose Pine Moon color scheme
- Transparent titlebar, maximized window, padding 4
- Copy-on-select, hide mouse while typing, Option as Alt
- `TERM=xterm-256color`, scrollback disabled (delegated to tmux)

### zsh

Shell config (`~/.zshrc`).

- Hand-rolled prompt with `vcs_info` (bold directory + bold cyan branch, red dirty markers)
- Native `compinit` completions
- `AUTO_CD`, colored `ls`, `..`/`...` aliases
- Gradle wrapper auto-detection
- fzf integration: `Ctrl+R` (history), `Ctrl+T` (files), `Alt+C` (cd) with fd backend and Rose Pine Moon theme
- SDKMAN
- Sources `~/.zshrc.local` for machine-specific config

Plugins (zsh-autosuggestions, zsh-syntax-highlighting) are auto-cloned to `~/.zsh/plugins/` on first shell startup.

### git

Git config (`~/.gitconfig`). Includes `~/.gitconfig.local` for machine-specific user details.

- `push.default = current`, `fetch.prune = true`
- Histogram diff algorithm
- Aliases: `lg` (graph), `ltop` (last 20), `stash-all`, `branches` (by recent), `cleanup` (delete merged), `cleanup-force` (delete all non-main)
- Default editor: nvim

### tmux

Multiplexer config (`~/.tmux.conf`).

- Prefix: `Ctrl+Space`
- Mouse enabled, true color, extended keys for Ctrl+Shift combos
- Vi keys in copy mode (`/` to search, `n`/`N` for next/prev)
- `|` / `-` for splits, vim-style pane navigation (`h/j/k/l`) and resize (`H/J/K/L`)
- 1-indexed windows/panes, renumber on close, 50k scrollback, zero escape delay
- New windows/splits open in current directory
- Clipboard integration: yank and mouse drag copy to system clipboard via `pbcopy`
- Top status bar: transparent bg, session name left, windows right, minimal styling
- Copy-mode indicator: scroll position + search results (no time)
- Subtle pane borders, activity monitoring for background windows
- Reload config: `prefix + r`

### [karabiner](https://karabiner-elements.pqrs.org/)

Keyboard remapper config (`~/.config/karabiner/karabiner.json`).

- Caps Lock → Meh key (Cmd+Ctrl+Option) for use with Hammerspoon shortcuts
- Note: Karabiner may rewrite/reformat this file when changed via its UI

### [hammerspoon](https://www.hammerspoon.org/)

macOS automation config (`~/.hammerspoon/init.lua`).

- Meh = Ctrl+Alt+Cmd (via Karabiner), Hyper = Shift+Meh
- Instant window moves (no animation)
- Window management: maximize (`Hyper+Return`), first third (`Meh+[`), last two thirds (`Meh+]`), move to next monitor (`Meh+Right`)
- App launcher: Ghostty (`Meh+G`), IntelliJ (`Meh+I`), Chrome (`Meh+C`)
- Reload config: `Meh+H`
- EmmyLua.spoon for `hs.*` LSP completions (`.luarc.json` points lua_ls at generated annotations)
- Sources `~/.hammerspoon/init.local.lua` for machine-specific config


### nvim

Neovim config (`~/.config/nvim/`). Modular Lua setup under `lua/matvey/`.

- Space leader, relative line numbers, 2-space indent, system clipboard
- Centered scrolling, visual move lines, persistent indent in visual mode
- Smart search (case-insensitive unless uppercase), persistent undo
- No swap/backup files, split right/below
- Highlight on yank, diagnostics with rounded borders, no virtual text
- Rounded borders on all floating windows (`winborder`)
- Rose Pine Moon colorscheme (transparency, dim inactive windows)
- Quickfix navigation: `]q`/`[q` next/prev
- Plugins managed with [lazy.nvim](https://github.com/folke/lazy.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua): fuzzy finder backed by fzf — actions (`<leader>a`), files (`<leader>o`, git-aware with fallback), all files (`<leader>O`), recent files (`<leader>e`), live grep (`<leader>f`), buffer grep (`<leader>/`), buffers (`<leader><Tab>`), resume (`<leader>;`), marks (`<leader>2`), help tags (`<leader><F1>` in non-LSP buffers), git log (`<leader>9`), and more
- [oil.nvim](https://github.com/stevearc/oil.nvim): file explorer as a buffer (`<leader>1`) — create/rename/delete files by editing text
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter/tree/main): syntax highlighting (auto-start on open; typical parsers: bash, java, json, kotlin, lua, markdown, query, vim, vimdoc, yaml)
- [treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): structural select (`vaf`/`vif` function, `vac`/`vic` class, `vaa`/`via` parameter), move (`]m`/`[m` method, `]]`/`[[` class), repeatable with `;`/`,`
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): git gutter signs, hunk navigation (`]c`/`[c`), stage (`<leader>ha`), reset (`<leader>hz`), undo stage (`<leader>hu`), preview (`<leader>hp`)
- [vim-fugitive](https://github.com/tpope/vim-fugitive): git porcelain — status (`<leader>0`), diff splits (`:Gvdiffsplit`), three-way merge (`:Gvdiffsplit!`), blame, log
- **LSP**: native nvim 0.12 setup (no lspconfig plugin) — `vim.lsp.config()` + `vim.lsp.enable()`, server configs in `lsp/` directory
  - [lua_ls](https://github.com/LuaLS/lua-language-server): Lua/LuaJIT language server (installed via brew); per-project `.luarc.json` for workspace-specific settings (e.g. Hammerspoon annotations)
  - Keymaps (buffer-local on attach): `gd` definition, `gr` references (fzf-lua), `<F18>` rename, `<leader><CR>` code action, `<leader><F1>` diagnostic float (overrides fzf-lua help tags in LSP buffers), `<C-p>` signature help
  - Document highlight: symbol under cursor highlighted on `CursorHold`, clears on move
  - Built-in completion: `vim.lsp.completion` with autotrigger, `<C-y>` accept, `<C-n>`/`<C-p>` navigate

### ideavim

IdeaVim config (`~/.ideavimrc`). Mirrors the core nvim editing experience in IntelliJ.

- Space leader, relative line numbers, system clipboard
- Centered scrolling, visual move lines, persistent indent in visual mode
- Smart search (case-insensitive unless uppercase), no highlight persistence
- Paste without overwriting register (`<leader>p`)
- Emulated plugins: highlightedyank (flash on yank), ideajoin (smart line joining), matchit (extended `%` matching)
