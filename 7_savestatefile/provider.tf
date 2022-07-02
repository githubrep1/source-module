terraform {
  
  backend "s3" {
    encrypt=true
    bucket = "devopsmonkss-terraform-state-storage"
    dynamodb_table = "devopsmonks-terraform-state-lock"
    key    = "state-lock-storage.keypath"
    region = "eu-west-1"
    # access_key = "<aws_access_key>"
    # secret_key = "<aws_secret_key>"
  }


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

