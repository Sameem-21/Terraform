# Step 1 - Provider Selection
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
module "network" {
  source             = "./modules/network"
  subnet_name_prefix = "net1"

  #vpc_cidr_block = "10.0.0.0/16"
}
module "security" {
  source      = "./modules/security"
  vpc_id      = module.network.vpc_id
  name_prefix = "sam-prod"
  #use_lifecycle= true
}
module "network_2" {
  source             = "./modules/network"
  subnet_name_prefix = "net2"

  #vpc_cidr_block = "10.0.0.0/16"
}
module "security_2" {
  source      = "./modules/security"
  vpc_id      = module.network_2.vpc_id
  name_prefix = "sam-prod2"
    #use_lifecycle= true

}


#vpc_id = module.network.vpc_id

module "keypair" {
  source = "./modules/key"

  #key_name = "deploy-keypair"

}

module "ami" {

  source = "./modules/ami"

  # Example AMI ID, replace with a valid one

}



module "aws_instance" {

  source             = "./modules/aws_instance"
  aws_instance_count = 5
  aws_ami_id         = module.ami.ami_id

  aws_instance_type = "t3.micro"
  aws_subnet_id     = module.network.sam_subnet_1

  aws_sec_grp     = [module.security.security_group_id]
  aws_key_profile = module.keypair.keypair_id
  name_offset     = 0


  # associate_public_ip_address = true 
}

module "aws_instance_2" {

  source             = "./modules/aws_instance"
  aws_instance_count = 2
  aws_ami_id         = module.ami.ami_id

  aws_instance_type = "t3.micro"
  aws_subnet_id     = module.network_2.sam_subnet_1

  aws_sec_grp     = [module.security_2.security_group_id]
  aws_key_profile = module.keypair.keypair_id
  name_offset     = 5
}