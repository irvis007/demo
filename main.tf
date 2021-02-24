module "instances" {
  source = "./modules/instances"

  pub_subnet_id              = module.network.aws-pub-subnet-id
  pub_vpc_security_group_ids = module.network.aws-pub-sg-id

  priv_subnet_id              = module.network.aws-priv-subnet-id
  priv_vpc_security_group_ids = module.network.aws-priv-sg-id

  env_instance_type  = local.env_instance_type
  env_instance_count = local.env_instance_count
  common_tags        = local.common_tags
  name_prefix        = var.name_prefix
}

module "network" {
  source = "./modules/network"

  in_vpc_cidr         = var.in_vpc_cidr
  in_pub_subnet_cidr  = var.in_pub_subnet_cidr
  in_priv_subnet_cidr = var.in_priv_subnet_cidr
  common_tags         = local.common_tags
  name_prefix         = var.name_prefix

}
