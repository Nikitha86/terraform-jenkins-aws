resource "aws_vpc" "myvpc" {
tags = {
Name = "terraform-jenkins-vpc"
}
cidr_block = var.vpc_cidr
instance_tenancy = "default"
}

resource "aws_subnet" "mysubnet" {
vpc_id = aws_vpc.myvpc.id
tags = {
Name = "Subnet1"
}
availability_zone = "us-east-1a"
cidr_block = var.public_subnet_cidr
}

resource "aws_security_group" "web_sg" {
vpc_id = aws_vpc.myvpc.id
ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_instance" "webapp" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = [aws_subnet.mysubnet.id]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name = var.key_name

user_data = <<-EOF
      #!/bin/bash
      yum install docker -y
      systemctl start docker
      systemctl enable docker
      EOF
}
