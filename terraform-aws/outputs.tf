# outputs.tf

# Shows the public IP address of the EC2 instance.
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.my_ec2_instance.public_ip
}

# Shows the public DNS of the EC2 instance.
output "instance_public_dns" {
  description = "The public DNS of the EC2 instance."
  value       = aws_instance.my_ec2_instance.public_dns
}

# Shows the ID of the EC2 instance.
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.my_ec2_instance.id
}

# Shows the ID of the created Security Group.
output "security_group_id" {
  description = "The ID of the created Security Group."
  value       = aws_security_group.instance_sg.id
}
