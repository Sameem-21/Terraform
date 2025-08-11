output "ec2_public_ips" {
  value       = module.aws_instance.public_ips
  description = "Public IPs of EC2 instances"
}

output "ec2_subnet_ids" {
  value       = module.aws_instance.subnet_ids
  description = "Subnet IDs of EC2 instances"
}

output "ec2_instance_names" {
  value       = module.aws_instance.instance_names
  description = "Name tags of EC2 instances"
}


