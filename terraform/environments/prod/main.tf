locals {
  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

module "network_prod" {
  source               = "../../modules/network"
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = local.azs
  tags                 = var.tags
}

module "security_prod" {
  source = "../../modules/security"
  vpc_id = module.network_prod.vpc_id
  allowed_ssh_cidr = "10.0.0.0/8"
  tags = var.tags
}

module "compute_prod" {
  source           = "../../modules/compute"
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  subnet_id        = module.network_prod.public_subnet_ids[0]
  security_group_id = module.security_prod.security_group_id
  master_count     = 3
  worker_count     = 5
  tags             = var.tags
}
