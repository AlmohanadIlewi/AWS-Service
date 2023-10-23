#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

# az definieren 
locals {

az_a = "eu-central-1a"                   # region = "eu-central1" local = "eu-centrala"
az_b = "eu-central-1b"
az_c = "eu-central-1c"
cidr_a = "10.0.1.0/24"
cidr_b = "10.0.2.0/24"
cidr_c = "10.0.3.0/24"
}

resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"

tags = {
Name = "TF VPC"
}

}

# Alle Locals werden innerhalb des locals Block definiert


# module "ec2_instances" {
#   source = "./ec2_instances_module"  # Pfad zum Verzeichnis des Moduls im gleichen Verzeichnis
# }

# output "ec2_instance_ids_b" {
#   value = aws_instance.EC1.id  # Hier wird die ID Ihrer EC2-Instanz als Beispiel verwendet
# }

# output "ec2_instance_ids_b" {
#   value = aws_instance.EC2.id  # Hier wird die ID Ihrer EC2-Instanz als Beispiel verwendet
# }

# output "ec2_instance_ids_c" {
#   value = aws_instance.EC3.id  # Hier wird die ID Ihrer EC2-Instanz als Beispiel verwendet
# }








