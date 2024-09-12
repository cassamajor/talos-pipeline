output "iam_role_arn" {
  description = "ARN of the IAM role used for VM Import"
  value       = aws_iam_role.vmimport.arn
}

output "ami_id" {
  description = "ID of the imported AMI"
  value       = aws_ami.this.id
}