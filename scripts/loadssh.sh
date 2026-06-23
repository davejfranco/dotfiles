#! /usr/bin/env bash
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" >/dev/null
fi

if ! ssh-add -l >/dev/null 2>&1; then
  ssh-add ~/.ssh/onomondo
fi

