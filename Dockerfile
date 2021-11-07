FROM --platform=linux/amd64 node:16-buster-slim

RUN  \
  apt update && \
  apt upgrade -y && \
  apt install -y \
    autoconf \
    curl \
    libgl1 \
    libglib2.0-dev \
    libvips \
    libxi6 \
    pkg-config \
    python3-pip \
  && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  npm install --global npm && \
  rm -rf /var/lib/apt/lists/*
