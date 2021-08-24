FROM node:14-buster-slim

RUN  \
  apt update && \
  apt upgrade -y && \
  apt install -y \
    autoconf \
    curl \
    libgl1 \
    libglib2.0-dev \
    libxi6 \
    pkg-config \
    python3-pip \
  && \
  mkdir -p /tmp && \
  curl -L https://github.com/libvips/libvips/releases/download/v8.11.3/vips-8.11.3.tar.gz -o /tmp/vips-8.11.3.tar.gz && \
  sha256sum /tmp/vips-8.11.3.tar.gz | grep "9b0a1d2f477d6fb4298d383a61232bcb4b2ea91ab76a1113d31883b50f3cdf01" && \
  cd /tmp && \
  tar -zvxf vips-8.11.3.tar.gz && \
  cd /tmp/vips-8.11.3 && \
  ./configure && \
  make && \
  make install && \
  cd / && \
  rm -rf /tmp/* && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  npm install --global npm && \
  adduser --system --disabled-login --no-create-home webpack && \
  rm -rf /var/lib/apt/lists/*

USER webpack