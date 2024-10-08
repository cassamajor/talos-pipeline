locals {
  ami_id = { ami_id = module.image_uploader.ami_id }
}

module "image_uploader" {
  source = "./modules/image-uploader"

  path_to_image = var.path_to_image
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
  control_plane               = var.control_plane
}