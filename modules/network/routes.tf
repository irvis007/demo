# Create route for public subnet to Internet Gateway
resource "aws_route_table" "pub-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - IGW route"
    )
  )

}

# Assign public route to public subnet
resource "aws_route_table_association" "route-assoc" {
  subnet_id      = aws_subnet.pub-subnet-1.id
  route_table_id = aws_route_table.pub-route.id
}

# create route for private network to NAT Gateway
resource "aws_route_table" "nat-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - NAT route"
    )
  )
}

# Assign private route to private subnet
resource "aws_route_table_association" "rt-for-priv-snet" {
  subnet_id      = aws_subnet.priv-subnet-1.id
  route_table_id = aws_route_table.nat-route.id
}
