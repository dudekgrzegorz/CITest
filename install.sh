#!/bin/bash

apt --assume-yes install git wget openssl libssl-dev cmake libcurl4-openssl-dev apt-transport-https curl gnupg binutils-dev openjdk-11-jdk
wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc

curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel-5.1.1

# install g++ 11
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt install -y gcc-11 g++-11

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 30
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-11 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30

