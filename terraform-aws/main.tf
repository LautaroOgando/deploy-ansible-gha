# main.tf

provider "aws" {
  region = var.aws_region
}

# t2.micro Free Tier instance type.
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical's official Ubuntu AMI owner ID.

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

# Security Group
resource "aws_security_group" "instance_sg" {

    name        = var.security_group_name
    description = "Allow SSH 22 and HTTP 80,Custom port 3001 inbound traffic"

   # Inbound rules
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH"
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        description = "Allow HTTP"
    }

    ingress {
        from_port   = 3001
        to_port     = 3001
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        description = "Allow Custom Port 3001"
    }

    # Outbound rules
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # all protocols
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
    tags = {
        Name = var.security_group_name
    }
}

# Create the Ubuntu EC2 instance.
resource "aws_instance" "my_ec2_instance" {
    ami             = data.aws_ami.ubuntu.id
    instance_type   = var.instance_type
    key_name        = var.key_pair_name 

    vpc_security_group_ids = [aws_security_group.instance_sg.id]

    tags = {
        Name = var.instance_name 
    }
}
