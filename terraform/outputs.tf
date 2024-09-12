output "vmimport_role_arn" {
  description = "The ARN of the VMimport role."
  value       = module.image_uploader.iam_role_arn
}