#!/usr/bin/env bash
set -euo pipefail

create_session() {
  local session="$1"
  shift
  local first_name="$1"
  local first_path="$2"
  shift 2

  if tmux has-session -t "=$session" 2>/dev/null; then
    echo "session '$session' already exists"
    return 0
  fi

  tmux new-session -d -s "$session" -n "$first_name" -c "$first_path"

  while (($# >= 2)); do
    local name="$1"
    local path="$2"
    shift 2
    tmux new-window -t "$session" -n "$name" -c "$path"
  done

  tmux select-window -t "${session}:1"
  echo "created session '$session'"
}

create_session onomondo \
  ansible "$HOME/Code/Work/Onomondo/ansible" \
  terraform "$HOME/Code/Work/Onomondo/terraform" \
  ono-platform "$HOME/Code/Work/Onomondo/ono-platform" \
  gitops-infra "$HOME/Code/Work/Onomondo/gitops-infra"

create_session quaderno \
  quaderno "$HOME/Code/Work/Quaderno/quaderno" \
  aws-infra "$HOME/Code/Work/Quaderno/aws-infra"

create_session personal \
  dotfiles "$HOME/.dotfiles" \
  devenv "$HOME/Code/Personal/devenv" \
  setup "$HOME/Code/Personal/setup"
