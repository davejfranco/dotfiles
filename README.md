## My dotfile config

This repo contains the different configs of the tools I use on a daily basis

### Requirements
- nvim 
- tmux
- ghostty 
- zsh
- opencode
- pi
- stow (this allows me to create symbolic links of the different config files)

### How to use
Clone the repository into its canonical hidden location:

```bash
git clone git@github.com:davejfranco/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Stow the packages you want to deploy. For example:

```bash
stow zsh nvim tmux starship opencode agents pi
```

Desktop packages can be deployed separately when needed:

```bash
stow ghostty hypr waybar
```

### Notes
- I used to use wsl2 so I have a directory with wsl2 specific configs but maybe I will remove it in the future
- Also changing my nvim config 
