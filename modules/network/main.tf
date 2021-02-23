terraform {
  required_providers {
    aws = ">=3.0.0"
  }
}

# Create VPC
resource "aws_vpc" "fcc-vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "FCC VPC"
  }
}

# Create Internet Gateway for public subnet
resource "aws_internet_gateway" "fcc-igw" {
  vpc_id = aws_vpc.fcc-vpc.id
  tags = {
    Name = "FCC IGW"
  }
}

# Create public subnet
resource "aws_subnet" "fcc-pub-subnet-1" {
  vpc_id                  = aws_vpc.fcc-vpc.id
  cidr_block              = var.pub-subnet-cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "fcc-subnet"
  }
}

resource "aws_network_interface" "fcc-pub-net-iface" {
  subnet_id = aws_subnet.fcc-pub-subnet-1.id

  tags = {
    Name = "fcc-iface"
  }
}

## << Private network set up >>
#
# Create EIP for NAT Gateway
resource "aws_eip" "fcc-eip" {
  vpc = true
}

# Create NAT Gateway with EIP
resource "aws_nat_gateway" "fcc-nat" {
  allocation_id = aws_eip.fcc-eip.id
  subnet_id     = aws_subnet.fcc-pub-subnet-1.id

  tags = {
    Name = "Nat Gateway"
  }
}

# Create private subnet
resource "aws_subnet" "fcc-priv-subnet-1" {
  vpc_id            = aws_vpc.fcc-vpc.id
  cidr_block        = var.priv-subnet-cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "fcc-priv-subnet"
  }
}
