output "ec2_public_ip" {
description = "Public Ip of Ec2 instance"
value = aws_instance.webapp.public_ip
}
output "vpc_id" {
  value = aws_vpc.myvpc.id
}
