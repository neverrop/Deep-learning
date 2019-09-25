# Terminal

sudo apt update
sudo apt upgrade
sudo apt-get install dconf-cli
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh
# enter themes: 22 179 162 142 45 

sudo apt-get install git zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo chsh -s $(which zsh)  # change shell to zsh for user
sudo apt-get install fonts-powerline silversearcher-ag autojump 
sudo apt install fonts-firacode
# Add these two lines in vscode setting, in both user and workplace
# "editor.fontFamily": "Fira Code Retina",
# for mac use : 'FiraCode-Retina'
# "editor.fontLigatures": true,

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting

sudo apt-get remove vim-common
sudo apt-get install vim


# Python

sudo apt install python3 python3-dev python3-pip python-dev python-pip ipython ipython3
sudo pip3 install thefuck
pip3 install opencv-python


# Desktop
sudo apt install gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell
# install https://extensions.gnome.org/extension/19/user-themes/  

# Software
wget https://github.com/innoob/netease-cloud-music/releases/download/1.1.1%2Brebuild.release-2/netease-cloud-music_1.1.1+rebuild.release-2_amd64.deb


# Shadowsocks

sudo apt install shadowsocks  # or shadowsocks-libev
sudo vi /etc/shadowsocks/config.json  
# Change config file
'''{
    "server":"jp.kingss.me",
    "server_port":42344,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"yfIU74utJM",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 1,
    "prefer_ipv6": false
}'''
sudo sslocal -c /etc/shadowsocks/config.json
systemctl enable shadowsocks  # start on login


# Chinese input method
sudo apt-get install ibus-pinyin # restart to add pinyin


# Deep learning frameworks
# tensorflow
pip3 install tensorflow-gpu keras

# Mxnet CUDA 10
pip3 install mxnet-cu100mkl gluoncv 
# to install nighty version
pip install —pre —upgrade mxnet-cu100 gluoncv

# Pytorch CUDA 10 python 3.6
pip3 install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
pip3 install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl


#CUDNN

sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
