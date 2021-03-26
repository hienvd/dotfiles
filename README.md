# dotfiles

### CTAGS

* Step 1: Install
```
brew install ctags
alias ctags="`brew --prefix`/bin/ctags"
```

* Step 2: Generate in RoR project
```
ctags -R --output-format=json --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) -f .tags
```

### COC.NVIM
http://blog.jamesnewton.com/setting-up-coc-nvim-for-ruby-development

### NVIM
`~/.config/nvim/init.vim`
