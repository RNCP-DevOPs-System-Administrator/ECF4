# Création Elastic IP (EIP)
resource "aws_eip" "eip_1" {
  domain = "vpc" # Permet l'attache à une ENI dans un VPC
  tags = {
    Name = "ElasticIP_1" # Identification de la ressource dans la console AWS
  }
}


# Création Network Interface (ENI)
resource "aws_network_interface" "network_interface_1" {
  subnet_id = var.subnet_id                # Associe cette interface au sous-réseau subnet_1
  private_ips     = ["192.168.1.20"]       # Adresse IP privée spécifique
  security_groups = [var.security_group_id]
  tags = {
    Name = "NetworkInterface_1"     # Identification de la ressource dans la console AWS
  }
}


# Attacher l'Elastic IP (EIP) à Network Interface (ENI)
resource "aws_eip_association" "eip_assoc_1" {
  allocation_id        = aws_eip.eip_1.id                             # ID IP élastique (EIP) associée à l'interface réseau
  network_interface_id = aws_network_interface.network_interface_1.id # ID de l'interface réseau (ENI) associée à l'EIP
}

