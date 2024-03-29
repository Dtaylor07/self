output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "security_group_id" {
  description = "id of the security group"
  value       = aws_security_group.allow_tls.id
}
