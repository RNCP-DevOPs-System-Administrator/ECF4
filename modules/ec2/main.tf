resource "aws_instance" "debian_bullseye_1" {
  ami           = "ami-000a08b963606bb82" # debian-11-amd64-20250402-2070 sur eu-east-1
  instance_type = "t2.micro"              # taille de l’instance EC2 (1 vCPU/ 1 GB)
  key_name      = "devops-fabrice"        # Nom de la paire de clés SSH créée dans AWS.
  # security_groups = [var.security_group_id] # Associe groupe de sécurité à l'instance Debian

  network_interface {
    device_index = 0 # Spécifie l'index de l'interface réseau

    # L'instance Debian utilisera l’interface réseau network_interface_1
    network_interface_id = var.network_interface_id
  }

  user_data = file("${path.module}/apache_install.sh")

    tags = {
    Name = "DebianBullseye_1" # Identification de la ressource dans la console AWS
  }
}


