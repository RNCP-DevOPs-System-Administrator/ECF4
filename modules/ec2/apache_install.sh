#!/bin/bash
apt update
apt install -y apache2
systemctl enable apache2
systemctl start apache2
echo '<html><body><h1><span style="color: blue;">Nom</span>: TOURNIER <span style="color: blue;">Prenom</span>: Fabrice</h1></body></html>' > /var/www/html/index.html
