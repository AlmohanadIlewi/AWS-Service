terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "first_instance" {
  ami           = "ami-XXXXXXX" # Hier die gültige AMI-ID eintragen
  instance_type = "t2.micro"
  subnet_id = "subnet-XXXXXX"
  tags = {
    Name = "myEC2Instance"
  
  }
}

