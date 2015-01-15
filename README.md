# dotfiles
.bashrc, .vimrc, .Xresources, and more (for xterm)

Set up Sublime vimrc:
  https://github.com/grigio/vim-sublime

Add local remote
$ git remote add origin git@github.com:sakibj/dotfiles.git

Generate ssh key:
$ ssh-keygen -t rsa -C "your_email@example.com"

Start ssh agent on OSS computers:
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_rsa_dotfiles
