eval "$(zoxide init zsh --cmd cd)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

# eza ( better 'ls')
alias l="eza --icons"
alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"
alias lt="eza -lTg --icons"

source <(fzf --zsh)

export FZF_CTRL_T_OPTS="
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'
--no-height"

export FZF_ALT_C_OPTS="
--preview 'tree -C {}'"

