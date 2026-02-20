output "dev_master_public_ips" {
  description = "Public IPs of dev masters"
  value       = module.compute_dev.master_public_ips
}

output "dev_worker_public_ips" {
  description = "Public IPs of dev workers"
  value       = module.compute_dev.worker_public_ips
}

output "dev_vpc_id" {
  description = "VPC id for dev"
  value       = module.network_dev.vpc_id
}
