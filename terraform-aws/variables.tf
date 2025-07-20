# variables.tf

# AWS Region variable.
variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1" # By default, you can change it as needed.
}

variable "key_pair_name" {
  description = "The name of the existing SSH key pair in AWS for the EC2 instance."
  type        = string
 
  default     = "ecs2k" 
}

variable "instance_type" {
  description = "The EC2 instance type to deploy."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name (Name tag) of the EC2 instance."
  type        = string
  default     = "MyFreeTierInstance"
}

variable "security_group_name" {
  description = "The name for the EC2 instance Security Group."
  type        = string
  default     = "MyUbuntuSecurityGroup"
}
