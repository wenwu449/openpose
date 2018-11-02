FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

RUN apt-get update && \
    apt-get install -y \
        cmake \
        git \
        python-pip \
        libopencv-dev \
        libatlas-base-dev \
        libprotobuf-dev \
        libleveldb-dev \
        libsnappy-dev \
        libhdf5-serial-dev \
        protobuf-compiler \
        libgflags-dev \
        libgoogle-glog-dev \
        liblmdb-dev && \
    apt-get install -y --no-install-recommends libboost-all-dev

RUN pip install --upgrade numpy protobuf

RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose

RUN cd openpose && mkdir build && cd build && cmake ..

RUN cd openpose/build && make -j`nproc`

WORKDIR /openpose