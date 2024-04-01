resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = var.files.index_document_suffix
  }

  error_document {
    key = var.files.error_document_key
  }

}

module "template_files" {
  source  = "hashicorp/dir/template"
  version = "1.0.2"

  base_dir = var.files.www_path != null ? var.files.www_path : "./www"
}