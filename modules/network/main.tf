terraform {
  required_providers {
    aws = ">=3.0.0"
  }
}

# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.in_vpc_cidr
  enable_dns_hostnames = true

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - VPC"
    )
  )
}

# Create Internet Gateway for public subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - IGW"
    )
  )

}

# Create public subnet
resource "aws_subnet" "pub-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.in_pub_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix}-pub-subnet"
    )
  )

}

resource "aws_network_interface" "pub-net-iface" {
  subnet_id = aws_subnet.pub-subnet-1.id

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - iface"
    )
  )

}

## << Private network set up >>
#
# Create EIP for NAT Gateway
resource "aws_eip" "eip" {
  vpc = true

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - eip"
    )
  )
}

# Create NAT Gateway with EIP
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub-subnet-1.id

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - NAT-GW"
    )
  )

}

# Create private subnet
resource "aws_subnet" "priv-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.in_priv_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix}-priv-subnet"
    )
  )

}
