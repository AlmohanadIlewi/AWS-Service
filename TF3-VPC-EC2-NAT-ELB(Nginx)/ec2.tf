resource "aws_instance" "EC1" {
  ami           = "ami-xxxxxx"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.lb_sg.id]

  key_name = "my-tf-key"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}

resource "aws_instance" "EC2" {
  ami           = "ami-xxxxxx"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_b.id
  vpc_security_group_ids = [aws_security_group.lb_sg.id]
  key_name = "my-tf-key"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}

resource "aws_instance" "EC3" {
  ami           = "ami-ami-xxxxxx"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_c.id
  vpc_security_group_ids = [aws_security_group.lb_sg.id]
  key_name = "my-tf-key"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}







# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# resource "aws_instance" "EC1" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_a.id
#   vpc_security_group_ids = [aws_security_group.sg.id]
# }

# resource "aws_instance" "EC2" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_b.id
#   vpc_security_group_ids = [aws_security_group.sg.id]
# }

# resource "aws_instance" "EC3" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_c.id
#   vpc_security_group_ids = [aws_security_group.sg.id]
# }


# Load-balancer
# resource "aws_instance" "EC1" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_a.id
#   vpc_security_group_ids = [aws_security_group.lb_sg.id]
# }

# resource "aws_instance" "EC2" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_b.id
#   vpc_security_group_ids = [aws_security_group.lb_sg.id]
# }

# resource "aws_instance" "EC3" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet_c.id
#   vpc_security_group_ids = [aws_security_group.lb_sg.id]
# }


