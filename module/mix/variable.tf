variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "tags" {
  description = "The tags"
  type        = map(string)
  default     = {}
}
