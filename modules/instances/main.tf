terraform {
  required_providers {
    aws = ">=3.0.0"
  }
}

resource "aws_instance" "web-serv" {
  ami       = data.aws_ami.amazon-ubuntu-arm-ami.id
  key_name  = var.key-name
  user_data = file("./modules/instances/apache2-ini.sh")
  tags      = merge(local.default-pub-instances-tags, var.common_tags)

  # input variables, expecting to be passed from root module
  instance_type          = var.env_instance_type
  subnet_id              = var.pub_subnet_id
  vpc_security_group_ids = [var.pub_vpc_security_group_ids]
  count                  = var.env_instance_count
}

resource "aws_instance" "priv-serv" {
  ami       = data.aws_ami.amazon-ubuntu-arm-ami.id
  key_name  = var.key-name
  user_data = file("./modules/instances/apache2-ini.sh")
  tags      = merge(local.default-priv-instances-tags, var.common_tags)

  subnet_id              = var.priv_subnet_id
  vpc_security_group_ids = [var.priv_vpc_security_group_ids]
  instance_type          = var.env_instance_type
  count                  = var.env_instance_count
}
