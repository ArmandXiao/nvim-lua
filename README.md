# Neovim config - lua

Rewrite `init.vim` from [ArmandXiao/vim](https://github.com/ArmandXiao/vim) to `init.lua`

## Quick installation
```
git clone https://github.com/ArmandXiao/nvim-lua.git ~/.config/nvim
```

## Where to place
for \*nix users
- place it under `~/.config~`

## Structure
- `init.lua` is going to `require()` lua files from `lua` folders.
- `plugin` folder is auto-generated by [packer plugin manager](https://github.com/wbthomason/packer.nvim)

# LSP
## JAVA
- use [jdtls-launcher](https://github.com/eruizc-dev/jdtls-launcher) **Recommanded**
- use [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) plugin for native LSP

### jdtls-launcher
> For easy use of java lsp

Follow instructions at [jdtls-launcher](https://github.com/eruizc-dev/jdtls-launcher) **Recommanded**

**Automatic installation**
```bash
curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash

# .bashrc, .zshrc or whatever shell you use
export PATH=$PATH:$HOME/.local/bin
```

then setup at `lsp-setup.lua`

```lua
require'lspconfig'.jdtls.setup{
   cmd = { 'jdtls' },
   root_dir = function(fname)
      return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
   end
}
```


### nvim-jdtls Installation
> [YOUTUBE: how to configue nvim-lsp | From scratch](https://www.youtube.com/watch?v=E-MvQC04Cbo&t=552s)

- first add it to plugin.lua
- go [jdtls bin](https://ftp.fau.de/eclipse/jdtls/snapshots/) download one
- then `tar zxvf jdtls-bin` to place you want
- Follow instructions on [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
  - create a `jdtls-launch` bash, then add it to `$PATH` a simple way is to
  ```
  sudo chmod +x jdtls-launch
  sudo cp jdtls-launch /usr/bin
  jdtls-launch
  ```

## Signature help
- [Signature Help](https://github.com/ray-x/lsp_signature.nvim)

---

- [Java lsp dont work](https://github.com/ray-x/lsp_signature.nvim/issues/97)
Solution:
```lua
require('lspconfig').jdtls.setup{
    settings = {
      java = {signatureHelp = {enabled = true}, contentProvider = {preferred = 'fernflower'}}
    },
    on_init = function(client)
      if client.config.settings then
        client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
      end
    end,
    ...
}
```

---

> Q: Why do we want to rewrite `init.vim`?
> A: **Why not?**
