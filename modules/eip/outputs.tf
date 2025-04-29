output "aws_eip_id" {
  value = aws_eip.eip_1.id
}


output "public_ip" {
  description = "Public IP of the Elastic IP"
  value       = aws_eip.eip_1.public_ip	 # Accès à l’IP avec module.eip.public_ip
}

output "aws_eni_id" {
  value = aws_network_interface.network_interface_1.id
}
