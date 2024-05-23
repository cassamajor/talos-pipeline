<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_sg"></a> [cluster_sg](#module_cluster_sg) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_elb_k8s_elb"></a> [elb_k8s_elb](#module_elb_k8s_elb) | terraform-aws-modules/elb/aws | ~> 4.0 |
| <a name="module_kubernetes_api_sg"></a> [kubernetes_api_sg](#module_kubernetes_api_sg) | terraform-aws-modules/security-group/aws//modules/https-443 | ~> 5.0 |
| <a name="module_talos_control_plane_nodes"></a> [talos_control_plane_nodes](#module_talos_control_plane_nodes) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_talos_worker_group"></a> [talos_worker_group](#module_talos_worker_group) | terraform-aws-modules/ec2-instance/aws | ~> 5.0 |
| <a name="module_vpc"></a> [vpc](#module_vpc) | terraform-aws-modules/vpc/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_iam_policy.control_plane_ccm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.worker_ccm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_volume_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.talos](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ccm"></a> [ccm](#input_ccm) | Whether to deploy aws cloud controller manager | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name) | Name of cluster | `string` | `"talos-aws-example"` | no |
| <a name="input_config_patch_files"></a> [config_patch_files](#input_config_patch_files) | Path to talos config path files that applies to all nodes | `list(string)` | `[]` | no |
| <a name="input_control_plane"></a> [control_plane](#input_control_plane) | Info for control plane that will be created | <pre>object({<br>    instance_type      = optional(string, "c5.large")<br>    ami_id             = optional(string, null)<br>    num_instances      = optional(number, 3)<br>    config_patch_files = optional(list(string), [])<br>    tags               = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_extra_tags"></a> [extra_tags](#input_extra_tags) | Extra tags to add to the cluster cloud resources | `map(string)` | `{}` | no |
| <a name="input_kubernetes_api_allowed_cidr"></a> [kubernetes_api_allowed_cidr](#input_kubernetes_api_allowed_cidr) | The CIDR from which to allow to access the Kubernetes API | `string` | `"0.0.0.0/0"` | no |
| <a name="input_talos_api_allowed_cidr"></a> [talos_api_allowed_cidr](#input_talos_api_allowed_cidr) | The CIDR from which to allow to access the Talos API | `string` | `"0.0.0.0/0"` | no |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr) | The IPv4 CIDR block for the VPC. | `string` | `"172.16.0.0/16"` | no |
| <a name="input_worker_groups"></a> [worker_groups](#input_worker_groups) | List of node worker node groups to create | <pre>list(object({<br>    name               = string<br>    instance_type      = optional(string, "c5.large")<br>    ami_id             = optional(string, null)<br>    num_instances      = optional(number, 3)<br>    config_patch_files = optional(list(string), [])<br>    tags               = optional(map(string), {})<br>    ebs_volume_size   = optional(number, 200)<br>  }))</pre> | <pre>[<br>  {<br>    "name": "default"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->