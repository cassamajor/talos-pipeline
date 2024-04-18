ccm                = false
cluster_name       = "talos-pipeline"
config_patch_files = []
control_plane = {
  ami_id = "ami-05c2712eb86ad8449"
}
extra_tags                  = {}
kubernetes_api_allowed_cidr = "0.0.0.0/0"
s3_bucket_arn               = "arn:aws:s3:::talos-pipeline-images"
talos_api_allowed_cidr      = "0.0.0.0/0"
vpc_cidr                    = "172.16.0.0/16"
worker_groups = [
  {
    name   = "default"
    ami_id = "ami-05c2712eb86ad8449"
  }
]
