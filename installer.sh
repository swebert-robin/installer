yum update -y
yum group install -y "Development Tools"
yum install -y centos-release-scl scl-utils-build devtoolset-7 epel-release

yum remove -y git
yum -y remove git-*
yum install -y https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
yum install -y git

yum install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

yum install -y jq

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

wget https://raw.github.com/troyxmccall/wd/master/setup/wd -O - | bash -s install

wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -O /tmp/k9s.tar.gz
tar -C /tmp -xzf /tmp/k9s.tar.gz
mv /tmp/k9s /usr/local/bin
rm -f /tmp/k9s.tar.gz /tmp/LICENSE /tmp/README.md

echo "export LC_ALL=en_US.UTF-8" >> /etc/environment
echo "export LANG=en_US.UTF-8" >> /etc/environment

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O .git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O .git-prompt.bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget https://raw.githubusercontent.com/swebert-robin/installer/main/.bashrc -O .bashrc
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.bash_aliases -O .bash_aliases
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.gitconfig -O .gitconfig
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.tmux.conf -O .tmux.conf
wget https://raw.githubusercontent.com/swebert-robin/installer/main/.vimrc -O .vimrc
