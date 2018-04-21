FROM jfloff/alpine-python:recent

ENV YQ_VERSION=1.14.1
RUN apk add --update ca-certificates openssl && update-ca-certificates && \
  rm -rf /tmp/* /var/cache/apk/*
RUN apk add --no-cache curl jq git openssh gawk tzdata && npm install yaml-front-matter -g && \
  rm -rf /tmp/* /var/cache/apk/*
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 && \ 
  mv yq_linux_amd64 /usr/bin/yq && \
  chmod +x /usr/bin/yq

#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
CMD [ "/bin/ash" ]
