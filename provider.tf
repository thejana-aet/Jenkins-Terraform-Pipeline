terraform {
  # backend "s3" {
  #   bucket         = "thejana-terraform-backend-bucket"
  #   dynamodb_table = "thejana-terraform-backend-lock-table"
  #   key            = "mystatefile/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  # }
  # backend "local" {
  #   path = "terraform.tfstate"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
