#!/bin/bash

# Aktualisiere das Paketverzeichnis
sudo apt-get update

# Installiere Nginx
sudo apt-get install -y nginx

# Starte den Nginx-Server
sudo systemctl start nginx

# Aktiviere Nginx, damit er beim Start der Instanz automatisch gestartet wird
sudo systemctl enable nginx
