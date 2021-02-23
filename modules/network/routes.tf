# Create route for public subnet to Internet Gateway
resource "aws_route_table" "fcc-pub-route" {
  vpc_id = aws_vpc.fcc-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fcc-igw.id
  }

  tags = {
    Name = "fcc-inet-rt"
  }
}

# Assign public route to public subnet
resource "aws_route_table_association" "fcc-route-assoc" {
  subnet_id      = aws_subnet.fcc-pub-subnet-1.id
  route_table_id = aws_route_table.fcc-pub-route.id
}

# create route for private network to NAT Gateway
resource "aws_route_table" "fcc-nat-route" {
  vpc_id = aws_vpc.fcc-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.fcc-nat.id
  }

  tags = {
    Name = "fcc--nat-rt"
  }
}

# Assign private route to private subnet
resource "aws_route_table_association" "fcc-rt-for-priv-snet" {
  subnet_id      = aws_subnet.fcc-priv-subnet-1.id
  route_table_id = aws_route_table.fcc-nat-route.id
}
