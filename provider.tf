provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-file-management"
    key     = "security/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}