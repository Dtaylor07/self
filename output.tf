output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3.s3_bucket.arn
}