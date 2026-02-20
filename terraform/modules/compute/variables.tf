variable "ami" {
  description = "AMI id"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet id to launch instances in"
  type        = string
}

variable "security_group_id" {
  description = "Security group id for instances"
  type        = string
}

variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 1
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
