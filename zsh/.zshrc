# Completions
autoload -Uz compinit && compinit

# Prompt — directory + git branch (bold) / status
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b' '%u%c'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
precmd() {
  vcs_info
  local git_info=""
  if [[ -n "$vcs_info_msg_0_" ]]; then
    git_info=" %B%F{cyan}${vcs_info_msg_0_}%f%b%F{red}${vcs_info_msg_1_}%f"
  fi
  PROMPT="%B%F{blue}%~%f%b${git_info} %F{green}➜%f "
}

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Navigation
setopt AUTO_CD
alias ..='cd ..'
alias ...='cd ../..'

# Gradle — auto-find gradlew in parent directories
gradle-or-gradlew() {
  local dir="$PWD"
  while [[ "$dir" != / ]]; do
    if [[ -x "$dir/gradlew" ]]; then
      echo "executing gradlew instead of gradle"
      "$dir/gradlew" "$@"
      return
    fi
    dir="${dir:h}"
  done
  command gradle "$@"
}
alias gradle=gradle-or-gradlew

# Plugins
ZSH_PLUGINS=~/.zsh/plugins
if [[ ! -d "$ZSH_PLUGINS/zsh-autosuggestions" ]]; then
  mkdir -p "$ZSH_PLUGINS"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS/zsh-autosuggestions"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS/zsh-syntax-highlighting"
fi
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Machine-specific config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
