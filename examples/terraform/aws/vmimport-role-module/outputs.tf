output "vmimport_role_arn" {
  description = "ARN of the vmimport IAM role"
  value       = aws_iam_role.vmimport.arn
}