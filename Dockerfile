FROM ubuntu:15.04

MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

RUN apt-get update

RUN apt-get install -y git \
                       flex \
                       bison \
                       libpng-dev \
                       build-essential

WORKDIR /root

RUN git clone https://github.com/MtnViewJohn/context-free.git

WORKDIR /root/context-free

RUN make

RUN ./cfdg -s 500 input/mtree.cfdg mtree.png
