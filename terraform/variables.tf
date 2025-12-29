variable "vpc_cidr" {
description = "CIDR block for VPC"
type = string
default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
description = "CIDR block for public subnet"
type = string
default = "10.0.1.0/24"
}

variable "instance_type" {
default = "t2.micro"
}
variable "ami_id" {
default = "ami-08d7aabbb50c2c24e"
}
variable "key_name" {
  description = "ec2 key pair name"
  default = "nikipractice"
}
