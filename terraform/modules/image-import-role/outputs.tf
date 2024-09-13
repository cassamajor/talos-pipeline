output "iam_role_arn" {
  description = "ARN of the IAM role used for VM Import"
  value       = aws_iam_role.vmimport.arn
}

output "bucket_id" {
  description = "ID of the S3 bucket used for VM Import"
  value       = aws_s3_bucket.this.id
}