terraform {
  required_version = ">= 1.0" # Wir wollen mindestens terraform version 1.0 verwenden

  required_providers {
    aws = {  # Der AWS Provider ermöglicht es AWS Resourcen zu erstellen
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# provider "aws" {
# region = var.region # Diese Terraform variable definieren wir im nächsten Schritt
# profile = "techstarter" # BITTE DEIN AWS PROFILE EINTRAGEN
# }

provider "aws" {
region     = "eu-central-1"
access_key = "DEIN_ACCESS_KEY"
secret_key = "DEIN_SECRET_KEY"
token      = "DEIN_TOKEN_KEY"

}