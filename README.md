The worst installation instructions ever:

git clone to somewhere on your computer

cd ~
ls -l
use mv to rename old .vim directory
use mv to rename old .vimrc file

Make soft links to the git repo you cloned:
ln -s /path/to/cloned/vim ~/.vim
ln -s /path/to/cloned/vim/vimrc ~/.vimrc

Try it:
vim aFileYouWantToEdit.txt

Hope it works.

Vim takes a long time to get the settings the way you want them so I made some shortcuts: 
,ev  :  edit vimrc (NORMAL MODE)
K    :  use while in vimrc to open settings documentation, hopefully to the setting your cursor is over (NORMAL MODE)