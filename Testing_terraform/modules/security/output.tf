output "security_group_id" {
  value       = aws_security_group.auto_sg_sam.id 
  description = "The ID of the security group associated with the AWS instance"
}


