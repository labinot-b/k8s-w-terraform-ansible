variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH"
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
