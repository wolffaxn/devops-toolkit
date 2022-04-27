FROM python:3.10.4-slim

ENV AZURE_CLI_VERSION=2.36.0
ENV HELM_VERSION=3.8.2
ENV KUBECTL_VERSION=1.23.6
ENV TERRAFORM_VERSION=1.1.9

# dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux \
  && apt-get update \
  && apt-get install -qq --no-install-recommends \
  curl \
  jq \
  locales \
  unzip \
  && rm -Rf /var/lib/apt/lists/* \
  && apt-get clean

# azure-cli
RUN set -eux \
  && locale-gen en_US.UTF-8 \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade azure-cli==${AZURE_CLI_VERSION}

# helm
RUN set -eux \
  && curl -Lso /tmp/helm.tar.gz https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -zxvf /tmp/helm.tar.gz -C /tmp \
  && cp /tmp/linux-amd64/helm /usr/bin \
  && chmod +x /usr/bin/helm \
  && rm -rf /tmp/*

# kubectl
RUN set -eux \
  && curl -Lso /tmp/kubectl https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && cp /tmp/kubectl /usr/bin \
  && chmod +x /usr/bin/kubectl \
  && rm -rf /tmp/*

# terraform
RUN set -eux \
  && curl -Lso /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip /tmp/terraform.zip -d /usr/bin \
  && rm -rf /tmp/*

#CMD ["az", "version"]
#CMD ["helm", "version"]
#CMD ["kubectl", "version --client"]
#CMD ["terraform", "version"]
