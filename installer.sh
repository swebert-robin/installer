yum update -y
yum group install -y "Development Tools"
yum install -y centos-release-scl scl-utils-build devtoolset-7 epel-release

yum remove -y git
yum -y remove git-*
yum install -y https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
yum install -y git

yum install -y tmux

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sL https://raw.github.com/troyxmccall/wd/master/setup/wd | bash -s install

echo "export LC_ALL=en_US.UTF-8" >> /etc/environment
echo "export LANG=en_US.UTF-8" >> /etc/environment

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget https://raw.githubusercontent.com/swebert-robin/installer/main/.bashrc
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.gitconfig
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.tmux.conf
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.vimrc
