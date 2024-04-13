variable "role_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = "vmimport"
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket used for VM import"
  type        = string
}