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

Shell config (`~/.zshrc`). Replaces Oh My Zsh with a lean manual setup.

- Hand-rolled prompt with `vcs_info` (bold directory + bold cyan branch, red dirty markers)
- Native `compinit` completions
- `AUTO_CD`, colored `ls`, `..`/`...` aliases
- Gradle wrapper auto-detection
- SDKMAN
- Sources `~/.zshrc.local` for machine-specific config and `~/.secrets` for tokens

Plugins (zsh-autosuggestions, zsh-syntax-highlighting) are auto-cloned to `~/.zsh/plugins/` on first shell startup.
