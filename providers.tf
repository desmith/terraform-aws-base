terraform {
  backend "s3" {}
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
