terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mybuckt-state"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"

  }
}


# Configure the AWS Provider
provider "aws" {
  region = var.region
}