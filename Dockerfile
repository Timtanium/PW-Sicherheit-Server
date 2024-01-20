FROM debian:12.4

LABEL description="Anwendungsserver für IT-Sicherheit: Seminar Passwortsicherheit"
LABEL author="Tim Bachmann"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    openssh-server \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt
COPY juice-shop-16.0.0_node20_linux_x64.tgz /opt/
RUN tar -xzvf juice-shop-16.0.0_node20_linux_x64.tgz
RUN rm juice-shop-16.0.0_node20_linux_x64.tgz
RUN mv juice-shop_16.0.0 juice-shop

COPY init.sh /opt/

COPY secret.txt /home/admin/

RUN chmod +x /opt/init.sh
RUN /opt/init.sh

#ENTRYPOINT service ssh start && bash
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

#CMD ["/usr/sbin/sshd", "-D", "-e"]
ENTRYPOINT /opt/init.sh

EXPOSE 22 3000
