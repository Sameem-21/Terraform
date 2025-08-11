# Step 7 - Security Group
resource "aws_security_group" "auto_sg_sam" {
  name        = "${var.name_prefix}-web_sg"
 #count = var.use_lifecycle ? 1 : 0
  description = "Allow HTTP, HTTPS, SSH inbound and all IPv4 outbound traffic"
  vpc_id      = var.vpc_id
  lifecycle {
    create_before_destroy=true
  }

  tags = {
    Name = "${var.name_prefix}-web_sg"
  }
}


# Inbound Rules
resource "aws_vpc_security_group_ingress_rule" "ssh_ipv4" {
  security_group_id = aws_security_group.auto_sg_sam.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  security_group_id = aws_security_group.auto_sg_sam.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_ipv4" {
  security_group_id = aws_security_group.auto_sg_sam.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# Outbound Rule
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.auto_sg_sam.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}