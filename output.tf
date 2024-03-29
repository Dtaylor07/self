output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket_module.arn
}

output "VPC_arn" {
  description = "ARN of the vpc"
  value       = module.s3_bucket_module.vpc_arn
}