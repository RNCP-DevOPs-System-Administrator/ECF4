terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0" # version du provider AWS terraform
    }
  }
  required_version = "1.11.4" # version du binaire terraform en local
}
provider "aws" {
  region     = "us-east-1" # déclaration de la région
}

module "vm_linux" {
  source = "./modules/vm_linux" # répertoire contenant le main.tf pour création de l’instance EC2
}
