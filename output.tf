output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket_module.arn
}

output "bucket_name" {
  description = "Name of the bucket"
  value       = module.s3_bucket_module.name
}