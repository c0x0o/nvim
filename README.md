# My Nvim Dot File

## Prerequisite

> To make all plugins and function work, you need nvim v0.6.0 at least

1. You should install `jq`, `rg`(aka `ripgrep`), `xxd`(it should appear in most unix distribution), `git`(ofcourse)
   `jq` is an json text processor. `rg` is for fast fulltext search. `xxd` is for hex view.
2. You should install your favourite lsp, such as `gopls` for golang, `rust-analyzer` for rust, `clangd` for c/cpp.
   These lsp command should appear in your `$PATH`.
3. Execute `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
   to install `nvim packer` -- an awesome nvim package manager written in lua.
4. Copy or Sym Link `nvim` folder to `$HOME/.config/nvim`
5. Open nvim and Run `PackerUpdate` command or just `nvim -c "PackerUpdate"`.
   You might see errors when you first open nvim. Don't worry about it. They will disappear
   after you install all plugins and restart.

Now enjoy you full IDE experience and blazing fast commandline editor with GREAT NVIM 

