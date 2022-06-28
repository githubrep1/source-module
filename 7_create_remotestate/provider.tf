terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
    # access_key = "${var.AWS_ACCESS_KEY}"
    # secret_key = "${var.AWS_SECRET_KEY}"
    region = "${var.AWS_REGION}"
    profile = "${var.AWS_PROFILE}"
 }

