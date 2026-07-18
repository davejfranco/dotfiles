[[ $- != *i* ]] && return
# Detect OS
case "$(uname -s)" in
  Darwin*) #macOS
  [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

  ZSH_THEME="powerlevel10k/powerlevel10k"
  # ZSH plugins
  plugins=(git tmux)

  source $ZSH/oh-my-zsh.sh

  # homebrew
  export PATH="/opt/homebrew/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"

  #docker 
  export PATH=/Applications/Docker.app/Contents/Resources/bin:$PATH 
  #Tailscale Macos 
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
  # opencode
  export PATH="$HOME/.opencode/bin:$PATH"
  # terraform
  alias tf='/opt/homebrew/bin/terraform'

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  # Created by `pipx` on 2024-08-12 12:29:59
  export PATH="$PATH:$HOME/.local/bin"

  # Add Cargo 
  export PATH="$HOME/.cargo/bin:$PATH"

  # Load Secrets 
  if [[ -f ~/.secrets ]]; then
    source ~/.secrets
  fi

  # kubectl-argo-rollouts
  alias kar='/usr/local/bin/kubectl-argo-rollouts'

  # Ruby
  export PATH="$HOME/.rbenv/bin:$PATH"
  if command -v rbenv >/dev/null; then eval "$(rbenv init - zsh)"; fi
  ;;
  Linux*) # Linux

  # Prefer the local systemd agent when present, but retain a forwarded agent
  # socket on remote hosts where this local socket does not exist.
  if [[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  fi

  # Ruby
  export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

  # Omarchy (only if installed)
  [[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && source /usr/share/omarchy-zsh/shell/zoptions
 
  # Initialize completion before fzf keybindings (fzf-completion uses .complete-word)
  autoload -Uz compinit compaudit
  mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"
  _zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${ZSH_VERSION}"
  compinit -d "$_zcompdump" 2>/dev/null || compinit -i -d "$_zcompdump"
  unset _zcompdump

  [[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

  # Prefer Omarchy's fzf completion on Tab if available
  #if (( $+widgets[fzf-completion] )); then
  #  bindkey '^I' fzf-completion
  #fi
  ;;
esac

export EDITOR=nvim

#GIT
export GPG_TTY=$TTY

#Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export GOPRIVATE="github.com/davejfranco/*"
export GOBIN=~/go/bin

#nvim
alias vim='nvim'
alias python='/usr/bin/python3'
alias k='/usr/local/bin/kubectl'

# opencode (already added in macOS section for Darwin)
[[ "$(uname -s)" != "Darwin" ]] && export PATH="$HOME/.opencode/bin:$PATH"
