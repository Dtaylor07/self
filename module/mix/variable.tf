variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "tags" {
  description = "The tags"
  type        = map(string)
  default     = {}
}

variable "files" {
  description = "Configuration for website files."
  type = object({
    terraform_managed     = bool
    error_document_key    = optional(string, "error.html")
    index_document_suffix = optional(string, "index.html")
    www_path              = optional(string)
  })
}