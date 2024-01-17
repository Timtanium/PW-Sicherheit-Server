# Anwendungsserver für das Seminar Passwortsicherheit 

Ein Docker Container für das Modul IT-Sicherheit.

Ziel ist die Bereitstellung eines einfachen SSH-Dienstes, der schnell und leicht auf den Computern des Netzlabors installiert werden kann.
Die Studenten können den Server mit allen möglichen Mitteln angreifen.

### Systemkonfiguration:
* Debian 12.4
* OpenSSH-Server
* Schlechte Config
  * Mehrere unsichere logins
  * Root-Login erlaubt

