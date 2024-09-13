output "iam_role_arn" {
  description = "ARN of the IAM role used for VM Import"
  value       = module.image_uploader.iam_role_arn
}

output "ami_id" {
  description = "ID of the imported AMI"
  value       = module.image_uploader.ami_id
}