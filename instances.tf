resource "aws_instance" "fcc-web-serv" {
  ami                    = data.aws_ami.amazon-ubuntu-arm-ami.id
  instance_type          = var.instnce-type
  key_name               = var.key-name
  subnet_id              = aws_subnet.fcc-pub-subnet-1.id
  vpc_security_group_ids = [aws_security_group.fcc-pub-sg.id]

  user_data = file("apache2-ini.sh")

  tags = local.default-pub-instances-tags
}

resource "aws_instance" "fcc-priv-serv" {
  ami                    = data.aws_ami.amazon-ubuntu-arm-ami.id
  instance_type          = var.instnce-type
  key_name               = var.key-name
  subnet_id              = aws_subnet.fcc-priv-subnet-1.id
  vpc_security_group_ids = [aws_security_group.fcc-priv-sg.id]

  user_data = file("apache2-ini.sh")

  tags = local.default-priv-instances-tags
}
