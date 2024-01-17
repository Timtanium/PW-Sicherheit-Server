FROM debian:12.4

LABEL description="Anwendungsserver für IT-Sicherheit: Seminar Passwortsicherheit"
LABEL author="Tim Bachmann"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
 && rm -rf /var/lib/apt/lists/*

COPY init.sh /opt/
COPY secret.txt /home/admin/

RUN chmod +x /opt/init.sh
RUN /opt/init.sh


#ENTRYPOINT service ssh start && bash
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd
CMD ["/usr/sbin/sshd", "-D", "-e"]
#ENTRYPOINT /opt/init.sh

EXPOSE 22
