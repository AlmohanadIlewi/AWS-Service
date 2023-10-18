
# Terraform-Konfigurationsblock
terraform {

    # Erforderliche Provider für das Projekt
    required_providers {
        docker = {
            # Quelle (Source) des Docker-Providers
            source = "kreuzwerker/docker"
        }
    }

    # Erforderliche Terraform-Version (mindestens Version 0.13)
    required_version = ">= 0.13"

    # Konfiguration für den S3-Backend-Typ
    backend "s3" {
        # AWS-Region, in der der S3-Bucket erstellt wurde
        region     = "eu-central-1"
        
        # AWS-Zugangsdaten: Access Key
        access_key = "xxxxx"

        # AWS-Zugangsdaten: Secret Key
        secret_key = "xxxxx"

        # Optional: AWS-Token, falls notwendig
        token      = "xxxxx"
        
        # Name der Terraform-Datei im Bucket
        key = "terraform-nginx.tfstate"
        
        # Name des S3-Buckets, in dem der Zustandsdatei gespeichert wird
        bucket = "docker-terraform-bucket"
    }
}
