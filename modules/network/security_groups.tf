# for a public subnet
# Create Security Group allowing
# HTTP/S to a subnet
# and any other communication from priv subnet
# outgoing communication
resource "aws_security_group" "pub-sg" {
  name        = "${var.name_prefix}-pub-allow_ssh-https_sg"
  description = "${var.name_prefix}-Allow SSH/HTTP/S inbound connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.contabo-ip[0]]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.contabo-ip[0]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - public SG"
    )
  )

}

# for a private subnet
# Create Security Group allowing
# HTTP/S to a subnet
# and any other communication from priv subnet
# outgoing communication
resource "aws_security_group" "priv-sg" {
  name        = "${var.name_prefix}-priv-allow_ssh-https_sg"
  description = "${var.name_prefix}-allow traffic from pub"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.in_vpc_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.name_prefix} - private SG"
    )
  )
}
