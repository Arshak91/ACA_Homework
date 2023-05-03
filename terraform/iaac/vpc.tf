# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-VPC"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "my-Subnet"
  }
}

# Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-IGW"
  }
}

#Create the route table
resource "aws_route_table" "my_rtb" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "my-RT"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "my-assoc" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rtb.id
}

#Assugn a public IP
# resource "aws_eip" "my_eip" {
#         vpc = true
# }

# resource "aws_network_interface" "my_eni" {
#         subnet_id = aws_subnet.my_subnet.id
# }

# resource "aws_eip_association" "my_eip_assoc" {
#         allocation_id = aws_eip.my_eip.id
#         network_interface_id = aws_network_interface.my_eni.id
# }



