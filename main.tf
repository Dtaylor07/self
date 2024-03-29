// first vpc

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "tf-main"
#   }

# }

module "s3_bucket_module" {
  source = "././module/s3"

  bucket_name = "dhaval-test-module-terraform-bucket-to-delete"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  cidr_block = "10.7.0.0"
  name       = "test-sg-tf-module"



}