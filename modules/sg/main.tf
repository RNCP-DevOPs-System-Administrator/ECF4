resource "aws_security_group" "security_group_1" {
  name        = "security-group-1"
  description = "Security group to allow SSH, HTTP, and HTTPS"
  vpc_id = var.vpc_id # Associe ce security group à vpc_1

  # Autoriser les connexions SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Autoriser les connexions HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Autoriser les connexions HTTPS (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Autoriser le trafic sortant
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Autorise tout le trafic sortant
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SecurityGroup_1" # Identification de la ressource dans la console AWS
  }
}
