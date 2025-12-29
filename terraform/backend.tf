terraform {
backend "s3" {
bucket = "terraform-jenkins-state-demo"
key = "dev/terraform.tfstate"
region = "us-east-1"
}
}
