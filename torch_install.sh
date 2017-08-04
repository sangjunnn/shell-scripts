#! /bin/bash

echo "Torch install.."

git clone "https://github.com/torch/distro.git ~/torch --recursive" "/home/sj/torch"

cd ~/torch

bash install-deps

./install.sh

source ~/.bashrc

# when 'luarocks intall something' is not working
sudo ~/torch/install/bin/luarocks install loadcaffe

luarocks install image

luarocks install torch

luarocks install nn

luarocks install lua-cjson

luarocks install cutorch

luarocks install cunn

luarocks install cudnn

luarocks install qtlua

luarocks install camera

luarocks lists
