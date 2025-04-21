variable "aws_access_key" {
  type = string
  description = "AWS Access Key ID"
  sensitive = true      # empêche l'affichage de la valeur de la variable dans les sorties plan et apply 
}

variable "aws_secret_key" {
  type = string
  description = "AWS Secret Access Key"
  sensitive = true      # empêche l'affichage de la valeur de la variable dans les sorties plan et apply
}
