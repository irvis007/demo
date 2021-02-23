
data "aws_ami" "amazon-ubuntu-arm-ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "name"
    values = ["*ubuntu*20*04*"]
  }

}
