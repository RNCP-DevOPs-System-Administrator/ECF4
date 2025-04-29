# Création VPC avec bloc CIDR spécifique
resource "aws_vpc" "vpc_1" {
  cidr_block           = "192.168.0.0/16" # Bloc CIDR utilisé avec le VPC
  enable_dns_support   = true             # Active la prise en charge DNS dans le VPC
  enable_dns_hostnames = true             # Permet la création de noms d'hôtes DNS dans le VPC
  tags = {
    Name = "aws_vpc_1" # Identification de la ressource dans la console AWS
  }
}

# Création Internet Gateway relié au VPC
resource "aws_internet_gateway" "igw_1" {
  vpc_id = aws_vpc.vpc_1.id # Associe l'Internet Gateway à vpc_1
  tags = {
    Name = "InternetGateway_1" # Identification de la ressource dans la console AWS
  }
}

# Création Table de Routage
resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.vpc_1.id # Associe cette table de routage à vpc_1
  route {
    cidr_block = "0.0.0.0/0"                   # Cette route permet l'accès à Internet
    gateway_id = aws_internet_gateway.igw_1.id # Trafic destiné à l'extérieur du VPC envoyé à IGW
  }
  tags = {
    Name = "RouteTable_1" # Identification de la ressource dans la console AWS
  }
}


# Création Subnet avec bloc CIDR spécifique
resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.vpc_1.id # Associe ce sous-réseau à vpc_1
  cidr_block        = "192.168.1.0/24" # Bloc CIDR du sous-réseau
  availability_zone = "us-east-1a"      # Zone de disponibilité cible
  tags = {
    Name = "Subnet_1" # Identification de la ressource dans la console AWS
  }
}

# Association Table de Routage / Subnet
resource "aws_route_table_association" "route_table_association_1" {
  subnet_id      = aws_subnet.subnet_1.id           #  ID du sous-réseau 192.168.1.0/24
  route_table_id = aws_route_table.route_table_1.id # ID de la table de routage 
}



