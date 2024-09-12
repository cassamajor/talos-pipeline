data "aws_iam_policy_document" "vmimport_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vmie.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["vmimport"]
    }
  }
}

data "aws_iam_policy_document" "vmimport_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:ModifySnapshotAttribute",
      "ec2:CopySnapshot",
      "ec2:RegisterImage",
      "ec2:Describe*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "vmimport" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.vmimport_trust_policy.json
}

resource "aws_iam_role_policy" "vmimport" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.vmimport.name
  policy = data.aws_iam_policy_document.vmimport_role_policy.json
}