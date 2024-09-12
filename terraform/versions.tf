terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = "~> 1.9.5"
}

provider "aws" {
  default_tags {
    tags = {
      Project     = "Talos Kubernetes Cluster"
      Provisioner = "Terraform"
      Environment = "Testing"
    }
  }
}
