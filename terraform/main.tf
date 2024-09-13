locals {
  ami_id = { ami_id = module.image_uploader.ami_id }
}

module "image_import_role" {
  source = "./modules/image-import-role"
}

module "image_uploader" {
  source = "./modules/image-uploader"
  count = var.path_to_image ? 1 : 0

  bucket_id     = module.image_import_role.bucket_id
  path_to_image = var.path_to_image
  role_name = var.role_name
}

module "talos" {
  source = "./modules/talos"

  ccm                         = var.ccm
  cluster_name                = var.cluster_name
  config_patch_files          = var.config_patch_files
  extra_tags                  = var.extra_tags
  kubernetes_api_allowed_cidr = var.kubernetes_api_allowed_cidr
  talos_api_allowed_cidr      = var.talos_api_allowed_cidr
  vpc_cidr                    = var.vpc_cidr
  worker_groups               = var.worker_groups
  control_plane               = merge(local.ami_id, var.control_plane)
}