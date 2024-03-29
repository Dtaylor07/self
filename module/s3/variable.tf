variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "tags" {
  description = "The tags"
  type        = map(string)
  default     = {}
}

variable "cidr_block" {
  description = "The cidr_block"
  type        = string
}

variable "name" {
  description = "The name of the security_group"
  type        = string
}

