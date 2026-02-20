variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "key_name" {
  description = "SSH key pair name to attach to instances"
  type        = string
  default     = "your-ssh-key-name"
}

variable "ami" {
  description = "AMI id to use for instances (Ubuntu 22.04 recommended)"
  type        = string
  default     = "ami-0123456789abcdef0"
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {
    Project = "kubernetes-terraform-ansible"
    Owner   = "labinot"
  }
}
