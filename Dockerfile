FROM alpine:3.19
LABEL description="Anwendungsserver für IT-Sicherheit: Seminar Passwortsicherheit"
LABEL author="Tim Bachmann"

RUN apk --no-cache add openssh && apk cache clean

COPY init.sh /opt/
COPY secret.txt /home/admin/

RUN chmod +x /opt/init.sh
ENTRYPOINT ["./opt/init.sh"]

EXPOSE 22
