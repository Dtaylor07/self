// first vpc

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "tf-main"
#   }

# }

module "s3_bucket_module" {
  source = "././module/mix"

  bucket_name = "dhaval-test-module-terraform-bucket-to-delete"

  tags = {
    terraform     = "true"
    environment   = "dev"
    public-bucket = true
  }
}