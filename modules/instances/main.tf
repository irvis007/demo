terraform {
  required_providers {
    aws = ">=3.0.0"
  }
}

resource "aws_instance" "fcc-web-serv" {
  ami           = data.aws_ami.amazon-ubuntu-arm-ami.id
  instance_type = var.instnce-type
  key_name      = var.key-name

  subnet_id              = var.pub_subnet_id
  vpc_security_group_ids = [var.pub_vpc_security_group_ids]

  user_data = file("./modules/instances/apache2-ini.sh")

  tags = local.default-pub-instances-tags
}

resource "aws_instance" "fcc-priv-serv" {
  ami           = data.aws_ami.amazon-ubuntu-arm-ami.id
  instance_type = var.instnce-type
  key_name      = var.key-name

  subnet_id              = var.priv_subnet_id
  vpc_security_group_ids = [var.priv_vpc_security_group_ids]

  user_data = file("./modules/instances/apache2-ini.sh")

  tags = local.default-priv-instances-tags
}
