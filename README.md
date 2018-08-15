# Deep-learning
environment installation for DL

# Ubuntu (Mac)



## Tips for terminal

#### [theme](https://github.com/Mayccoll/Gogh)

```Sh
sudo apt-get install dconf-cli
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh
# chalk(22), ocean dark
```

#### [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```sh
apt-get install git zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

vi ~/.zshrc
ZSH_THEME=agnoster
DEFAULT_USER=$USER
# or
prompt_context() {}
```

```Bash
chsh -s $(which zsh)  # change shell to zsh for user
if passwd needed:
Changing /etc/pam.d/chsh: from:
auth       required   pam_shells.so
to
auth       sufficient   pam_shells.so
```

#### [Powerfonts](https://github.com/powerline/fonts)

```Sh
sudo apt-get install fonts-powerline
```

#### [silver searcher](https://github.com/ggreer/the_silver_searcher)

```sh
 sudo apt-get install silversearcher-ag
 for mac:
 brew install the_silver_searcher
```

#### [auto-suggestion](https://github.com/zsh-users/zsh-autosuggestions)

```Sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-autosuggestions

plugins=(zsh-autosuggestions) 
```

#### [highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting
plugins=(zsh-syntax-highlighting)
source ~/.zshrc
```

#### [autojump](https://github.com/wting/autojump)

```sh
sudo apt-get install autojump

. /usr/share/autojump/autojump.sh
#add this to ~/.zshrc
```

#### [thefuck](https://github.com/nvbn/thefuck)

```sh
sudo apt update
sudo apt install python3-dev python3-pip python-dev python-pip
sudo pip3 install thefuck
```

```sh
brew install thefuck  # OSX
```



-----



## Environment for Deep learning



### CUDA and drivers

1. [Download CUDA](https://developer.nvidia.com/cuda-downloads) , [cuda 9.1](https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_387.26_linux)[ tensorflow only support [cuda 8](https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run)  ]

2. Remove any other installation (sudo apt-get purge nvidia-cuda* - if you want to install the drivers too, then sudo apt-get purge nvidia-*.)

3. ```
   sudo sh cuda7.5.18linux.run --override
   ```

   If cannot install graphic driver.

   1. if error: It appears that an X server is running:

      enter non-GUI mode (tty1,.eg.)

      ```
      sudo service lightdm stop
      ```

   2. if LC_ALL warning

      ```
      echo "export LC_ALL="en_US.UTF-8"" >> ~/.zshrc
      ```

   3. [install Nvidia driver manually](https://askubuntu.com/questions/851069/latest-nvidia-driver-on-ubuntu-16-04)

      ```
      lspci | grep -i nvidia  # check the gpu device
      ```

      [Download the right driver version](http://www.nvidia.com/Download/index.aspx?lang=en-us)

      ```Bash
      sudo add-apt-repository ppa:graphics-drivers/ppa
      sudo apt update
      sudo apt-get install nvidia-*
      ```

      If failed due to kernel issues, it might due to the wrong gcc version.

      Use 'gcc -v' to check gcc version.

      [install the right gcc version needed](https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91)

      ```
      sudo update-alternatives --config gcc  # switch gcc version
      ```

4. Add path to ~/.zshrc or ~/.bashrc

   ```sh
   echo "export PATH=$PATH:/usr/local/cuda-8.0/bin
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64" >> ~/.zshrc
   ```

5. Verify CUDA installation

   ```sh
   nvcc --version 
   nvidia-smi
   ```

### CUDNN

1. [Download cudnn](https://developer.nvidia.com/cudnn):

   1. [cudnn8](https://www.dropbox.com/s/8d77zlu6l13ueop/cudnn-8.0-linux-x64-v7.1.tar?dl=0)
   2. [cudnn9](https://www.dropbox.com/s/twhhs5xwv5wu3l7/cudnn-9.0-linux-x64-v7.tar?dl=0)

2. Unzip the cuDNN package.

   ```Bash
   tar -xvf cudnn-9.0-linux-x64-v7.tar
   ```

3. Copy the following files into the CUDA Toolkit directory.

   ```bash
   sudo cp cuda/include/cudnn.h /usr/local/cuda/include
   sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
   sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
   ```




### Anoconda

1. Download the installer:

   - [Anaconda installer for Linux](https://www.anaconda.com/download/).  [python3.6 for linux](https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh)

2. In your Terminal window, run:

   ```Bash
   bash Anaconda-latest-Linux-x86_64.sh
   ```

3. add path

   ```bash
   echo "# added by Anaconda3 installer
   export PATH="/home/never/anaconda3/bin:$PATH"" >> ~/.zshrc
   ```

### [Pytorch](http://pytorch.org)

```
conda install pytorch torchvision -c pytorch
```



### [tensorflow](https://www.tensorflow.org/install/install_linux#InstallingAnaconda)

1. Follow the instructions on the [Anaconda download site](https://www.continuum.io/downloads) to download and install Anaconda.

2. Create a conda environment named `tensorflow` to run a version of Python by invoking the following command:

   ```
   $ conda create -n tf python=3.6
   ```

3. Activate the conda environment by issuing the following command:

   ```
   $ source activate tf
    (tf)$  # Your prompt should change 
   ```

4. Issue a command of the following format to install TensorFlow inside your conda environment: ([cuda9.0](https://github.com/mind/wheels/releases/tag/tf1.4-gpu-cuda9))

   ```
   sudo ln -s /usr/local/cuda/lib64/libcudnn.so.7.0.4 /usr/local/cuda/lib64/libcudnn.so.6pip install --ignore-installed --upgrade \ https://github.com/mind/wheels/releases/download/tf1.4-gpu-cuda9/tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl
   ```

5. MKL

   ```Bash
   # If you don't have cmake
   sudo apt install cmake

   git clone https://github.com/01org/mkl-dnn.git
   cd mkl-dnn/scripts && ./prepare_mkl.sh && cd ..
   mkdir -p build && cd build && cmake .. && make
   sudo make install

   echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc
   ```

6. Verification 

   if import tensorflow —> error: *.so.8.0 not found

   ```Bash
   for i in *so.9.1;do
   for> sudo ln -s $i ${i/%9.1/9.0}
   for> done
   ```




------

📚 Author : never

📅 Date : 2018.3.1

📧 Contact : zbh@ut-vision.org
