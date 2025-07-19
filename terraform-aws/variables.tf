# variables.tf

# AWS Region variable.
variable "aws_region" {
  description = "La región de AWS donde se desplegarán los recursos."
  type        = string
  default     = "us-east-1" # By default, you can change it as needed.
}

variable "key_pair_name" {
  description = "El nombre del par de claves SSH existente en AWS para la instancia EC2."
  type        = string
 
  default     = "ecs2k" 
}

variable "instance_type" {
  description = "El tipo de instancia EC2 a desplegar."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "El nombre (etiqueta Name) de la instancia EC2."
  type        = string
  default     = "MyFreeTierInstance"
}

variable "security_group_name" {
  description = "El nombre para el Security Group de la instancia EC2."
  type        = string
  default     = "MyUbuntuSecurityGroup"
}
