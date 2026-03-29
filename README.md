# Punti

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package that mirrors the target file structure under `$HOME`.

## Usage

```sh
cd punti
stow <package>        # symlink a package into ~
stow --restow <package>  # re-symlink (useful after changes)
stow -D <package>     # unlink a package
```

## Packages

### ghostty

Terminal emulator config (`~/.config/ghostty/config`).

- Hack Nerd Font Mono 14pt, font thickening, contextual alternates disabled
- Rose Pine Moon theme
- Transparent titlebar, maximized window, padding 4
- Copy-on-select, hide mouse while typing, Option as Alt

### alacritty

Terminal emulator config (`~/.config/alacritty/alacritty.toml`).

- Hack Nerd Font Mono 14pt
- Default color scheme
- Transparent titlebar, maximized window, padding 4
- Copy-on-select, hide mouse while typing, Option as Alt
- `TERM=xterm-256color`, scrollback disabled (delegated to tmux)

### zsh

Shell config (`~/.zshrc`).

- Hand-rolled prompt with `vcs_info` (bold directory + bold cyan branch, red dirty markers)
- Native `compinit` completions
- `AUTO_CD`, colored `ls`, `..`/`...` aliases
- Gradle wrapper auto-detection
- SDKMAN
- Sources `~/.zshrc.local` for machine-specific config and `~/.secrets` for tokens

Plugins (zsh-autosuggestions, zsh-syntax-highlighting) are auto-cloned to `~/.zsh/plugins/` on first shell startup.

### git

Git config (`~/.gitconfig`). Includes `~/.gitconfig.local` for machine-specific user details.

- `push.default = current`, `fetch.prune = true`
- Histogram diff algorithm
- Aliases: `lg` (graph), `ltop` (last 20), `stash-all`, `branches` (by recent), `cleanup` (delete merged)

### tmux

Multiplexer config (`~/.tmux.conf`).

- Prefix: `Ctrl+Space`
- Mouse enabled, true color, extended keys for Ctrl+Shift combos
- `|` / `-` for splits, vim-style pane navigation (`h/j/k/l`) and resize (`H/J/K/L`)
- 1-indexed windows/panes, 50k scrollback, zero escape delay
- New windows/splits open in current directory
- Top status bar: transparent bg, session name + git branch left, windows right, minimal styling
- Subtle pane borders, activity monitoring for background windows

### nvim

Neovim config (`~/.config/nvim/`). Modular Lua setup under `lua/matvey/`.

- Space leader, relative line numbers, 2-space indent, system clipboard
- Centered scrolling, visual move lines, persistent indent in visual mode
- Smart search (case-insensitive unless uppercase), persistent undo
- No swap/backup files, split right/below
- Plugins managed with native Neovim packages (work in progress)
