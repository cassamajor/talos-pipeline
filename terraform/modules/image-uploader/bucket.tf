# Upload the image to S3
resource "aws_s3_object" "object" {
  bucket      = var.bucket_id
  key         = basename(var.path_to_image)
  source      = var.path_to_image
  source_hash = filemd5(var.path_to_image)
}

# Import the image from S3
resource "aws_ebs_snapshot_import" "this" {
  disk_container {
    format = "RAW"
    user_bucket {
      s3_bucket = var.bucket_id
      s3_key    = aws_s3_object.object.id
    }
  }

  role_name = var.role_name
}

# Register the image
resource "aws_ami" "this" {
  name                = aws_s3_object.object.id
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  imds_support        = "v2.0"
  ena_support         = true
  architecture        = "x86_64"

  ebs_block_device {
    device_name           = "/dev/xvda"
    snapshot_id           = aws_ebs_snapshot_import.this.id
    volume_size           = 8
    delete_on_termination = true
    volume_type           = "gp3"
  }
}
