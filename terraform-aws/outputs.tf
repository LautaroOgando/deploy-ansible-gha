# outputs.tf

output "instance_public_ip" {
  description = "La dirección IP pública de la instancia EC2."
  value       = aws_instance.my_ec2_instance.public_ip
}

output "instance_public_dns" {
  description = "El DNS público de la instancia EC2."
  value       = aws_instance.my_ec2_instance.public_dns
}

output "instance_id" {
  description = "El ID de la instancia EC2."
  value       = aws_instance.my_ec2_instance.id
}

output "security_group_id" {
  description = "El ID del Security Group creado."
  value       = aws_security_group.instance_sg.id
}
