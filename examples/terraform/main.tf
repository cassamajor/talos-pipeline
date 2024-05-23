module "vmimport_role" {
  source = "./modules/vmimport-role"

  s3_bucket_arn = var.s3_bucket_arn
}

module "talos" {
  source = "./modules/talos"


}