module "vmimport_role" {
  source = "./modules/vmimport-role"

  s3_bucket_arn = var.s3_bucket_arn
}

module "talos" {
  source = "./modules/talos"

  ccm                = var.ccm
  cluster_name       = var.cluster_name
  config_patch_files = var.config_patch_files
  control_plane = var.control_plane
  extra_tags                  = var.extra_tags
  kubernetes_api_allowed_cidr = var.kubernetes_api_allowed_cidr
  talos_api_allowed_cidr      = var.talos_api_allowed_cidr
  vpc_cidr                    = var.vpc_cidr
  worker_groups = var.worker_groups
}