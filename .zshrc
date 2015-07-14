# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
# config for zsh theme
ZSH_THEME="hienvd"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git vi-mode vim-interaction ruby rails)

source $ZSH/oh-my-zsh.sh
# User configuration
source ~/.bash_profile

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
