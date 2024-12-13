# Linting Commands
```
terraform fmt -recursive
terraform-docs tfvars hcl .
terraform-docs markdown --escape=false --output-file=README.md --recursive
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.7.5 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_talos"></a> [talos](#module_talos) | ./modules/talos | n/a |
| <a name="module_vmimport_role"></a> [vmimport_role](#module_vmimport_role) | ./modules/vmimport-role | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ccm"></a> [ccm](#input_ccm) | Whether to deploy aws cloud controller manager | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name) | Name of cluster | `string` | `"talos-aws-example"` | no |
| <a name="input_config_patch_files"></a> [config_patch_files](#input_config_patch_files) | Path to talos config path files that applies to all nodes | `list(string)` | `[]` | no |
| <a name="input_control_plane"></a> [control_plane](#input_control_plane) | Info for control plane that will be created | <pre>object({<br>    instance_type      = optional(string, "c5.large")<br>    ami_id             = optional(string, null)<br>    num_instances      = optional(number, 3)<br>    config_patch_files = optional(list(string), [])<br>    tags               = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_extra_tags"></a> [extra_tags](#input_extra_tags) | Extra tags to add to the cluster cloud resources | `map(string)` | `{}` | no |
| <a name="input_kubernetes_api_allowed_cidr"></a> [kubernetes_api_allowed_cidr](#input_kubernetes_api_allowed_cidr) | The CIDR from which to allow to access the Kubernetes API | `string` | `"0.0.0.0/0"` | no |
| <a name="input_role_name"></a> [role_name](#input_role_name) | Name of the IAM role to create | `string` | `"vmimport"` | no |
| <a name="input_s3_bucket_arn"></a> [s3_bucket_arn](#input_s3_bucket_arn) | ARN of the S3 bucket used for VM import | `string` | `"arn:aws:s3:::talos-aws-example"` | no |
| <a name="input_talos_api_allowed_cidr"></a> [talos_api_allowed_cidr](#input_talos_api_allowed_cidr) | The CIDR from which to allow to access the Talos API | `string` | `"0.0.0.0/0"` | no |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr) | The IPv4 CIDR block for the VPC. | `string` | `"172.16.0.0/16"` | no |
| <a name="input_worker_groups"></a> [worker_groups](#input_worker_groups) | List of node worker node groups to create | <pre>list(object({<br>    name               = string<br>    instance_type      = optional(string, "c5.large")<br>    ami_id             = optional(string, null)<br>    num_instances      = optional(number, 3)<br>    config_patch_files = optional(list(string), [])<br>    tags               = optional(map(string), {})<br>    ebs_volume_size    = optional(number, 200)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "default"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmimport_role_arn"></a> [vmimport_role_arn](#output_vmimport_role_arn) | The ARN of the VMimport role. |
<!-- END_TF_DOCS -->