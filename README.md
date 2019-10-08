# vimconfig
my vim config

# install
```sh
mkdir -p ~/work
git clone git@github.com:romaintb/vimconfig.git ~/work/vimconfig
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# classic vim
ln -s ~/work/vimconfig/ ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
# neovim
mkdir -p ~/.config
ln -s ~/work/vimconfig ~/.config/nvim
ln -s ~/.config/nvim/.vimrc ~/.config/nvim/init.vim
vim # then ignore warning, and type :BundleInstall
```
