locals {
  azs = ["eu-west-1a", "eu-west-1b"]
}

module "network_dev" {
  source               = "../../modules/network"
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = local.azs
  tags                 = var.tags
}

module "security_dev" {
  source = "../../modules/security"
  vpc_id = module.network_dev.vpc_id
  allowed_ssh_cidr = "0.0.0.0/0"
  tags = var.tags
}

module "compute_dev" {
  source           = "../../modules/compute"
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  subnet_id        = module.network_dev.public_subnet_ids[0]
  security_group_id = module.security_dev.security_group_id
  master_count     = 1
  worker_count     = 2
  tags             = var.tags
}
