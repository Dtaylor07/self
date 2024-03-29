output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket_module.arn
}

output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket_module.aws_vpc.main.arn
}