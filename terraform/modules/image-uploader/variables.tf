variable "role_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = "vmimport"
}

variable "bucket_name" {
  description = "Name of the S3 bucket used for VM import"
  type        = string
  default     = "k8s-omni-images"
}

variable "path_to_image" {
  description = "Path to the extracted Omni image"
  type        = string
}