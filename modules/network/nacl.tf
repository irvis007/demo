# create VPC Network access control list for pub subnets
resource "aws_network_acl" "pub-Security-ACL" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.pub-subnet-1.id]

  # allow ingress, HTTP, port 80
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  # allow ingress, HTTPS, port 443
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow ingress, SSH, from known ips
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.contabo-ip[0]
    from_port  = 22
    to_port    = 22
  }

  # allow ingress, return traffic from hosts on the internet that are responding to requests originating in the subnet. [Ephemeral ports]
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # allow egress, HTTP, port 80
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  # allow egress, HTTPS port 443
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow egress, Ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 65535
  }

  # allow egress, SSH to VPC private network
  egress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = var.in_priv_subnet_cidr
    from_port  = 22
    to_port    = 22
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - pub subnet NACL"
    )
  )

}

# create VPC Network access control list for priv subnets
resource "aws_network_acl" "priv-Security-ACL" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.priv-subnet-1.id]

  # allow ingress, SSH, from pub-subnet ips
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.in_pub_subnet_cidr
    from_port  = 22
    to_port    = 22
  }

  # allow ingress, return traffic from hosts on the internet that are responding to requests originating in the subnet. [Ephemeral ports]
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # allow egress, HTTP, port 80
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  # allow egress, HTTPS port 443
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow egress, Ephemeral ports, from pub-subnet
  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.in_pub_subnet_cidr
    from_port  = 32768
    to_port    = 65535
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - priv subnet NACL"
    )
  )

}
