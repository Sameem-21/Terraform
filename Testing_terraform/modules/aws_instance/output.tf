#output subnet_id{
 #   value = var.aws_subnet_id
  #  description = "The ID of the subnet where the AWS instance is launched"
#}
#output security_group_id{
    #value = var.aws_sec_grp
    #description = "The ID of the security group associated with the AWS instance"
#}
#output "public_ip" {
#value = aws_instance.public_ip   
#description = "The public IP address of the AWS instance"     
#}

output "public_ips" {
  value       = [for inst in aws_instance.web : inst.public_ip]
  description = "List of public IPs for all EC2 instances"
}

output "subnet_ids" {
  value       = [for inst in aws_instance.web : inst.subnet_id]
  description = "List of subnet IDs for all EC2 instances"
}

output "instance_names" {
  value       = [for inst in aws_instance.web : inst.tags["Name"]]
  description = "List of Name tags for all EC2 instances"
}

