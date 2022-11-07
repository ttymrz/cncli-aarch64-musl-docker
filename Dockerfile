FROM messense/rust-musl-cross:x86_64-musl

RUN  apt-get update -y \
     && apt-get install -y \
     autoconf \
     automake \
     make \
     m4 \
     libffi-dev \
     libgmp-dev \
     libncursesw5 \
     libtinfo-dev \
     libtool \
     libssl-dev \
     libsystemd-dev \
     wget \
     zlib1g-dev

WORKDIR /usr/local/src
RUN wget -nv https://www.openssl.org/source/openssl-1.1.1s.tar.gz \
    && tar xzf openssl-1.1.1s.tar.gz 

WORKDIR /usr/local/src/openssl-1.1.1s
RUN CC='x86_64-unknown-linux-musl-cc -fPIE -pie' ./Configure no-shared no-async no-pic --prefix=/usr/local/openssl --openssldir=/usr/local/openssl/ssl linux-x86_64 \
    && make depend \
    && make -j \
    && make install

ENV OPENSSL_DIR=/usr/local/openssl
ENV PKG_CONFIG_ALLOW_CROSS=1
ENV OPENSSL_STATIC=1

WORKDIR /home/rust/src
