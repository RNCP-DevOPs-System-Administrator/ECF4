terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0" # version du provider AWS terraform
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.7.0" # version du provider VAULT terraform
    }
  }
  required_version = "1.11.4" # version du binaire terraform en local
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "my-role"
}
provider "aws" {
  region     = "us-east-1" # déclaration de la région
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "root"
}

module "vm_linux" {
  source = "./modules/vm_linux" # répertoire contenant le main.tf pour création de l’instance EC2
}
