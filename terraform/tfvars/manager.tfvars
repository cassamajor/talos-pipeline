cluster_name       = "pipeline-manager"
control_plane = {
  ami_id = "ami-05c2712eb86ad8449"
}
s3_bucket_arn               = "arn:aws:s3:::talos-pipeline-images"
worker_groups = [
  {
    name          = "default"
    instance_type = "c5.large"
    ami_id        = "ami-05c2712eb86ad8449"
    num_instances = 1
  }
]
