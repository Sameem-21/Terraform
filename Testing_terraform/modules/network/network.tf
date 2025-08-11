resource "aws_vpc" "Sam_auto_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC_Sam"
  }
}

# Step 3 - Subnet Creation
resource "aws_subnet" "sam_subnet_1" {
  vpc_id            = aws_vpc.Sam_auto_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.subnet_name_prefix}-subnet-1"
  }
}

output "subnet_id_debug" {
  value = aws_subnet.sam_subnet_1.id
}


# Step 4 - Internet Gateway Creation
resource "aws_internet_gateway" "sam-1-igw" {
  vpc_id = aws_vpc.Sam_auto_vpc.id

  tags = {
    Name = "sigw"
  }
}

# Step 5 - Route Table
resource "aws_route_table" "sam_auto_rt" {
  vpc_id = aws_vpc.Sam_auto_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sam-1-igw.id
  }

  tags = {
    Name = "rt1auto"
  }
}


# Step 6 - Subnet Association
resource "aws_route_table_association" "sam_auto_rt" {
  subnet_id      = aws_subnet.sam_subnet_1.id
  route_table_id = aws_route_table.sam_auto_rt.id
}