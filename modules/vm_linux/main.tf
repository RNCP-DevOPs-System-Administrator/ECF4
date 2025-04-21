resource "aws_instance" "vm_linux" {
  ami           = "ami-07a6f770277670015" # Image Amazon Linux 2
  instance_type = "t2.micro"              # taille de l’instance EC2 (1 vCPU/ 1 GB)
  tags = {
    Name = "vm_linux"
  }
}
