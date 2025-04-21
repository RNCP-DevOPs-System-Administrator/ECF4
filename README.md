- Créer une repo git
- Créer une branche dev
- Pushez chaques prochaines étapes sur dev (pour la correction)
- Créer une organisation et un workspace Terraform Cloud
- Connecter ce workspace au repo précédemment mentionnée Terraform Cloud
- Choisissez un provider parmi cette liste https://registry.terraform.io/browse/providers
- Créer un compte sur le provider cloud AWS : https://aws.amazon.com/
- Créez un module contenant une VM linux simple configuré à ce provider
- Se référer à la documentation terraform pour celui-ci: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
(Pas besoin de provisionner quoi que ce soit, faire juste en sorte que l’initialisation du provider fonctionne
et de pouvoir planifier une machine virtuelle sur le provider)
- À la place de passer les clés api directement, passez les via des default variables dans un fichier nommé variables.tf
- Enlevez ces variables du code et passer les via Terraform Cloud
