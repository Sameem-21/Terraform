terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  count                       = var.aws_instance_count # howmany instances to create
  ami                         = var.aws_ami_id
  instance_type               = var.aws_instance_type
  subnet_id                   = var.aws_subnet_id
  key_name                    = var.aws_key_profile
  vpc_security_group_ids      = var.aws_sec_grp
  associate_public_ip_address = true

  tags = {
    Name = "sam--web-instance-${count.index + var.name_offset+ 1}"
  }
}