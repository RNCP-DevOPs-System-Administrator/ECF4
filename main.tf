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
}

module "ec2" {
  source = "./modules/ec2" # répertoire contenant le main.tf pour création de l’instance EC2
  security_group_id = module.sg.aws_security_group_id
  network_interface_id = module.eip.aws_eni_id 
}

module "vpc" {
  source = "./modules/vpc" # répertoire contenant le main.tf pour création des instances VPC/Gateway/Route/Subnet
}

module "eip" {
  source = "./modules/eip" # répertoire contenant le main.tf pour création de l’instance EIP et ENI
  subnet_id  = module.vpc.aws_subnet_id
  security_group_id = module.sg.aws_security_group_id
}

module "sg" {
  source = "./modules/sg" # répertoire contenant le main.tf pour création de l’instance SecurityGroup
  vpc_id  = module.vpc.aws_vpc_id
}


resource "null_resource" "export_public_ip" {
  depends_on = [module.eip]
  provisioner "local-exec" {
    command = "echo ${module.eip.public_ip} > public_ip.txt"
  }
}
