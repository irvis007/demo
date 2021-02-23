output "pub-instance-tags" {
  value = module.instances.fcc-web-serv-tags
}

output "fcc-public-ip" {
  value = module.instances.fcc-public-ip
}

output "fcc-priv-instances-ips" {
  value = module.instances.fcc-public-ip
}
