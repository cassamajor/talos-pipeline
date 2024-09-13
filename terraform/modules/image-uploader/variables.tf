variable "bucket_id" {
  description = "Name of the S3 bucket used for VM import"
  type        = string
}

variable "path_to_image" {
  description = "Path to the extracted Omni image"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role used for VM import"
  type        = string
}