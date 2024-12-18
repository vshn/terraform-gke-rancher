FROM hashicorp/terraform:1.10.3

RUN apk add --no-cache \
  bash \
  curl \
  python3

RUN curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN curl -sLo /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-320.0.0-linux-x86_64.tar.gz \
  && tar xzf /tmp/google-cloud-sdk.tar.gz -C /opt \
  && rm -rf /tmp/google-cloud-sdk.tar.gz \
  && /opt/google-cloud-sdk/install.sh -q \
  && rm -rf /tmp/google-cloud-sdk \
  && ln -s /opt/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

ENTRYPOINT []
