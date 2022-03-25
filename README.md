# My Nvim Dot File

## Prerequisite

To make all plugins and function work, you need nvim v0.6.0 at least.

Neovim could be compiled either with Lua or LuaJIT. But without LuaJIT,
global search for file and file content won't be functional. You may also
see some error about 'Lua Rocks' in this situation, just ignore it. Since
LuaJIT is available on most hardware platform, I extremly recommend you to
use the version with LuaJIT.

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

## Tips

### Leader Key

Use `<space>` as leader key.

### Global Search

Use `ctrl-p` to open the window for file global searching.

Use `ctrl-f` to open the window for file content global searching.

### Terminal

Use `ctrl-c` to open float terminal window.

If you want to exit, press `esc` key to exit insert mode in terminal window,
and press `esc` again to close terminal window.

### GUI Copy Mode

Sometimes, you may want to copy some content from your GUI terminal. But there
are so many annoying elements in nvim window, such as line number, git status
sign, etc.

Use `:GUICopy` to remove them, and use `:GUICopyEnd` to get them back.

### Languange Server Protocol

We current add default lsp binding:

1. `gopls` for golang
2. `rust-analyzer` for rust
3. `clangd` for c/cpp
4. `python-lsp-server` for python

You can install any of them by your choice. Missing either of them won't effect
other components. You should make sure installed lsp server is located in your
`$PATH`.

Use `gd` to go to definition.

Use `gD` to go to declaration.

Use `gr` to find symbol references.

Use `<leader>k` to see function document.

Use `<leader>e` to see possible diagnostic information.

Use `<leader>[` to goto previous diagnostic position in current file.

Use `<leader>]` to goto next diagnostic position in current file.

Use `ctrl-o` to jump back. This is a default shortcut for vim jump list.

For more shortcut, see `lua/config/plugins/lspconfig.lua`.

### Tree viewer

Use `<leader>t` to toggle project tree viewer.

### Comment toggle

Use `<leader>c` to toggle comment for a line. Also available in VISUAL mode.

### Git

Use `<leader>{` to jump to previous hunk.

Use `<leader>}` to jump to next hunk.

Use `<leader>p` to preview the diff of hunk.

### More About Shortcut

See files in `lua/config/editor` and `lua/config/plugins`

## Hack

Since this project is focus on my coding experience, you might want to change
something to your favourite. Here is how I organized all things:

```plain
lua/
  |---- config/
          |---- editor/                  * editor setup, eg. nu, tabstop
          |---- plugins/
                  |---- init.lua         * load all plugins, you might want to
                  |---- fix.lua          * resolve some plugin conflict, last module to load in init.lua
                  |---- <plug-name>.lua  * private setting for each plugin
          |---- theme.lua                * enable theme after all plugins are loaded
  |---- utils.lua                        * put your global helper function here
init.lua                                 * nvim will load it on start up, start from here
README.md                                * this doc
```

Hope these will help you. Happy Hacking!

PS. I will be very appreciated if report any bug to me.
