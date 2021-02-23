# for a public subnet
# Create Security Group allowing
# HTTP/S to a subnet
# and any other communication from priv subnet
# outgoing communication
resource "aws_security_group" "fcc-pub-sg" {
  name        = "fcc-pub-allow_ssh-https_sg"
  description = "Allow SSH/HTTP/S inbound connections"
  vpc_id      = aws_vpc.fcc-vpc.id

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

  tags = {
    Name = "FCC - Allow SSH/HTTP/S inbound connections"
  }
}

# for a private subnet
# Create Security Group allowing
# HTTP/S to a subnet
# and any other communication from priv subnet
# outgoing communication
resource "aws_security_group" "fcc-priv-sg" {
  name        = "fcc-priv-allow_ssh-https_sg"
  description = "allow traffic from pub"
  vpc_id      = aws_vpc.fcc-vpc.id

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
}
