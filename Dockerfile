FROM node:14-buster-slim

RUN  \
  apt update && \
  apt upgrade -y && \
  apt install -y python-pip libgl1 libxi6 autoconf && \
  pip install awscli && \
  npm install --global npm && \
  npm install --global aws-cdk && \
  rm -rf /var/lib/apt/lists/*