FROM --platform=linux/amd64 debian:bookworm-slim

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
  curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh && \
  bash nodesource_setup.sh && \
  apt install nodejs && \
  rm /usr/lib/python3.11/EXTERNALLY-MANAGED && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  npm install --global npm && \
  npm install --global aws-cdk && \
  rm -rf /var/lib/apt/lists/*
