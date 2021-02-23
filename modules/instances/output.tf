#
output "fcc-web-serv-tags" {
  value = aws_instance.fcc-web-serv.tags
}

output "fcc-public-ip" {
  value = aws_instance.fcc-web-serv.public_ip
}

output "fcc-priv-instances-ips" {
  value = aws_instance.fcc-priv-serv.private_ip
}
