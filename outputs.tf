output "pub-instance-tags" {
  value = module.instances.web-serv-tags
}

output "public-ip" {
  value = module.instances.public_ips
}

output "priv-instances-ips" {
  value = module.instances.priv_instances_ips
}
