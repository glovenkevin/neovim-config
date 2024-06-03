# Neovim Config

This is my private neovim config for development. Feel free to pick this up.

## Configuration

- NerdTree
- vim-go
- coc
- vim-plug : As the plugin manager

## Themes

- One-dark pro
- Cascadia-code NerdFont

## Incoming changes

- adding config for javascript (vue and react) development

## Instalation

1. Clone this project, and then place it into this directory `~/.config/nvim`. More clearer way to do it, you can check it on [here](https://github.com/nanotee/nvim-lua-guide)
2. Install `vim-plug` from [this](https://github.com/junegunn/vim-plug)
3. Then do the plug install command by `:PlugInstall`
4. Last but not least is that dont't forget to install `nodejs` and `neovim` with `python3`

```bash
	brew install nodejs
	pip3 install neovim
```

5. Run this command inside the neovim

```
    :CocInstall coc-json coc-go \
        coc-html coc-css \
        coc-tsserver coc-eslint coc-prettier \
        coc-pairs \
        | q
```

> This are the Coc dependency autocompletion 6. Run this command for installing `vim-go` binary support

```
    :GoInstallBinaries
```

## Helper
