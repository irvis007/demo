#
output "web-serv-tags" {
  value = aws_instance.web-serv[*].tags
}

output "public_ips" {
  value = aws_instance.web-serv[*].public_ip
}

output "priv_instances_ips" {
  value = aws_instance.priv-serv[*].private_ip
}
