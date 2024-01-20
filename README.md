# Unsicherer Server als Docker Container für Studenten

Dieser Docker-Container wurde speziell für das Modul IT-Sicherheit entwickelt. 

Er stellt einen unsicheren Server bereit, der von den Studenten mit allen möglichen Mitteln angegriffen werden kann.

### Systemkonfiguration:
* Debian 12.4
* OpenSSH-Server
  * Schlechte Config
    * Mehrere unsichere logins
    * Root-Login erlaubt
* OWASP Juice Shop

Dies ist eine absichtlich unsichere Webanwendung, die für Sicherheitstrainings und -bewusstsein entwickelt wurde. Sie enthält mehrere Sicherheitslücken, die von den OWASP Top 10 identifiziert wurden.

## Logins:
```
root:password
admin:admin
michael:cocacola
tim:17071985
radio:paloma
```

## Installation:
* juice-shop-16.0.0_node20_linux_x64.tgz herunterladen und in das Verzeichnis kopieren
* Dockerfile ausführen und damit Container bauen

oder fertigen Container von Dockerhub laden:

``` docker pull tbachi/pws-server:latest ```