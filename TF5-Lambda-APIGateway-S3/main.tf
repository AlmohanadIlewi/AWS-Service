
# Schriebe die definition für dein das aws Profil und die Region in die variables.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" { 
    region = var.region
    profile = var.aws_profile
    }
