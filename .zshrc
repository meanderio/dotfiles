#. "$HOME/.local/bin/env"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# eza 
alias l="eza --icons"
alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"
alias lt="eza -lTg --icons"

# fzf
source <(fzf --zsh)

export FZF_CTRL_T_OPTS="
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'
--no-height"

export FZF_ALT_C_OPTS="
--preview 'tree -C {}'"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# default editor
export EDITOR="nvim"
export VISUAL="nvim"

# update PATH
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
