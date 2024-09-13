output "ami_id" {
  description = "ID of the imported AMI"
  value       = aws_ami.this.id
}