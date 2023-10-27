# Schriebe die definition für dein das aws Profil und die Region in die variables.tf
terraform {

    required_version = ">= 1.0" # Wir wollen mindestens terraform version 1.0 verwenden
required_providers {

    aws = {                    # Der AWS Provider ermöglicht es AWS Resourcen zu erstellen
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
}
}
provider "aws" {
    region = var.region
    profile = var.aws_profile
    }