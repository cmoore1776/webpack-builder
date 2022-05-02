FROM --platform=linux/amd64 node:18-bullseye-slim

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
  # curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh && \
  # bash nodesource_setup.sh && \
  # apt install nodejs && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  npm install --global npm && \
  rm -rf /var/lib/apt/lists/*
