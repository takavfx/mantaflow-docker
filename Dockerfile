FROM ubuntu:bionic

RUN apt update && apt upgrade && \
    apt install wget git && \
    apt install cmake g++ git python3-dev qt5-qmake qt5-default && \
    apt install python python-pip

RUN pip install --upgrade numpy tqdm matplotlib Pillow imageio

RUN mkdir /work && cd /work && \
    git clone https://bitbucket.org/mantaflow/manta.git && \
    cd manta && mkdir build && cd build && \
    cmake .. -DGUI=OFF -DOPENMP=ON -DNUMPY=ON && \
    make -j8