#
output "aws-pub-subnet-id" {
  value = aws_subnet.pub-subnet-1.id
}

output "aws-priv-subnet-id" {
  value = aws_subnet.priv-subnet-1.id
}

output "aws-pub-sg-id" {
  value = aws_security_group.pub-sg.id
}

output "aws-priv-sg-id" {

  value = aws_security_group.priv-sg.id
}
