FROM gcc:7

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    libboost-all-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    zlib1g-dev libbz2-dev libsnappy-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/facebook/rocksdb/archive/v5.8.8.tar.gz \
  && tar xzvf v5.8.8.tar.gz \
  && cd rocksdb-5.8.8 \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make -j4 \
  && make install \
  && make clean \
  && cd ..
