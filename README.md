# Neovim Setup
- Main source is from defaslife/craftzdog

## Platforms
- in Linux: for treesitter you can use 'gcc' and it's fine
- in Windows 64: for treesitter you shold 'zig' as compiler because generates 64 executable files
- in Windows 32: I think using 'gcc' as fine as it is

## Install Packer:
Linux:
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Windows (Powershell):
```shell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
- Source: [*Packer*](https://github.com/wbthomason/packer.nvim)

## Plugins (Installation)
```bash
npm install -g @fsouza/prettierd
```


## vimrc
The content of `./vimrc` is for vscode vim configuration and shortcuts setup


## Sources
- [Takuya Matsuyama - Medium](https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4)

