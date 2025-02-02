FROM --platform=linux/amd64 debian:trixie-slim

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
    python-is-python3 \
    unzip \
  && \
  curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
  cd /tmp && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -f /etc/apt/keyrings/nodesource.gpg && \
  rm -f /etc/apt/sources.list.d/nodesource.list && \
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
  apt update && \
  apt install -y nodejs && \
  rm -f /usr/lib/python3.*/EXTERNALLY-MANAGED && \
  python -m pip install --upgrade pip && \
  npm install --global npm && \
  npm install --global aws-cdk && \
  rm -rf /tmp/* && \
  rm -rf /var/lib/apt/lists/*
