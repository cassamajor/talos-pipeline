This module creates the IAM role and policy required for importing VM images into AWS.
Additionally, it creates the bucket, uploads the image, and registers it to be used as an AMI.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.vmimport](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.vmimport](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.vmimport_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vmimport_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_name"></a> [role_name](#input_role_name) | Name of the IAM role to create | `string` | `"vmimport"` | no |
| <a name="input_s3_bucket_arn"></a> [s3_bucket_arn](#input_s3_bucket_arn) | ARN of the S3 bucket used for VM import | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmimport_role_arn"></a> [vmimport_role_arn](#output_vmimport_role_arn) | ARN of the vmimport IAM role |
<!-- END_TF_DOCS -->