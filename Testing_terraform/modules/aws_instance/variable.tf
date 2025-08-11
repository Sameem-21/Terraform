variable "aws_instance_count" {
  description = "Number of AWS instances to create"
  type        = number
  default     = 1
}
variable "aws_instance_type" {
  description = "Type of AWS instance to create"
  type        = string
  default     = "t2.micro"
}
variable "aws_ami_id" {
  description = "AMI ID for the AWS instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one
}
variable "aws_subnet_id"{

  description = "Subnet ID for the AWS instance"
  type        = string
  default     = "subnet-0bb1c79de3EXAMPLE" # Example Subnet ID, replace with a valid one
}
variable "aws_sec_grp"{

  description = "Security Group ID for the AWS instance"
  type        = list(string)
  #default     = "sg-0a1b2c3d4e5f6g7h8" # Example Security Group ID, replace with a valid one
}
variable "aws_key_profile" {
  type = string
}

variable "name_offset" {
  type    = number
  default = 0
}


  
