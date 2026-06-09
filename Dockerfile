FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    bash \
    tar \
    curl \
    ca-certificates \
    gnupg \
    lsb-release

# install Azure CLI properly
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

WORKDIR /app

COPY scripts/ /app/scripts/

RUN chmod +x /app/scripts/backup.sh

CMD ["/app/scripts/backup.sh"]
