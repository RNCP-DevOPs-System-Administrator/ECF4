# RNCP DevOps System Administrator
<ins>**Evaluation en cours de Formation ECF4**</ins>

#  🚀 INFRASTRUCTURE EN PRODUCTION DANS LE CLOUD

## 📋 Etapes de Création avec TERRAFORM vers AWS Cloud:

- 1.	Un VPC avec un bloc CIDR spécifique
- 2.	Une internet gateway IGW relié à ce VPC
- 3.	Une route table permettant de router tout le trafic provenant de la gateway
- 4.	Un SUBNET avec un bloc CIDR spécifique
- 5.	Une association route table / subnet
- 6.	Un SECURITY GROUP permettant la connection SSH, HTTP et HTTPS
- 7.	Une INTERFACE NETWORK et une ELASTIC IP
- 8.	Une INSTANCE DEBIAN bullseye liée au network interface
- 9.	Une KEY PAIR reliée à l'instance permettant de se connecter en ssh
- 10.	Et enfin un script exécuté dans les user_data de l’instance configurant un serveur APACHE et injectant  nom/prénom dans le fichier /var/www/html/index.html

## 🎯 Livrables :
- Un serveur http contenant  nom/prénom consultable via internet
