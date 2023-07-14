terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  required_version = ">= 0.13"
}

provider "aws" {
  region  = "eu-west-2"
}

# Bucket creation
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "sarah-terraform-bucket"
}


# Disabling bucket public access
resource "aws_s3_bucket_public_access_block" "my_s3_bucket_access" {
  bucket = aws_s3_bucket.my_s3_bucket.id


  # Block public access
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
