#
output "aws-pub-subnet-id" {
  value = aws_subnet.fcc-pub-subnet-1.id
}

output "aws-priv-subnet-id" {
  value = aws_subnet.fcc-priv-subnet-1.id
}

output "aws-pub-sg-id" {
  value = aws_security_group.fcc-pub-sg.id
}

output "aws-priv-sg-id" {

  value = aws_security_group.fcc-priv-sg.id
}
