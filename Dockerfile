FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget build-essential git-core cmake zlib1g-dev libncurses-dev

WORKDIR /opt
RUN wget https://github.com/genome/bam-readcount/archive/v0.7.4.tar.gz && tar xvzf v0.7.4.tar.gz && rm v0.7.4.tar.gz

RUN cd /opt/bam-readcount-0.7.4 && mkdir build && cd build && cmake ../ && make deps && make -j && make install
