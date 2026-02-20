terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "k8s/dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
