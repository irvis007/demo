module "instances" {
  source = "./modules/instances"

  pub_subnet_id              = module.network.aws-pub-subnet-id
  pub_vpc_security_group_ids = module.network.aws-pub-sg-id

  priv_subnet_id              = module.network.aws-priv-subnet-id
  priv_vpc_security_group_ids = module.network.aws-priv-sg-id
}

module "network" {
  source = "./modules/network"
}
