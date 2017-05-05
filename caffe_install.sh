#! /bin/sh

echo "start installing Caffe on Ubuntu"

echo "General Dedendencies"

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler

sudo apt-get install --no-install-recommends libboost-all-dev

echo "Installing BLAS.."

sudo apt-get install libatlas-base-dev

#Download Anaconda2 or Python
read -p "Would you like to download Anaconda2?[Y/n]" yn

    case $yn in

        [Yy]* )wget http://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh;bash Anaconda2-4.3.0-Linux-x86_64.sh;;

        [Nn]* )sudo apt-get install the python-dev;;

        *)
    esac 

#Additional dependencies for Ubuntu 14.04
read -p "Are you using Ubuntu 14.04?[y/n]" yn

    case $yn in

        [Yy]* )sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev;;

        [Nn]* ) echo "No need to download additional dependencies";;
        
        *)
    esac

echo "Installing Git.."

sudo apt-get install git

echo "Downloading Caffe source from github.."

git clone https://github.com/BVLC/caffe.git

cd caffe

cp Makefile.config.example Makefile.config

gedit Makefile.config

make -j8 all
make -j8 test
make -j8 pycaffe
make -j8 runtest


