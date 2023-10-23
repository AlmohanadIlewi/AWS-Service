
# resource "aws_key_pair" "my_key_pair" {
#   key_name   = "myneu-tf-key-unique.pem"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCD8ZAhpo2mp23OlW6dIr7XKegddJ0wN1AL+RmCoGSP+Ltu62gd/vXkRZa0AV/hfNOTmA28oXeTyy9pgHCpuVaKiMbYdsOwnQrX9+bdQZUNsE7tFHwQQH2vYatVQJ7Dyh0vj+zF8HTkWhnTMT+d8ohRtlyeghy2e3m2HZs0JaxFpXnKb7NOxUQyQA9us3NDUzLchcfeWoMmvYlPGvWlQwvpKFeZ/Fmn9pYsealPjoz+lVbyjTwNkfMtmBw6jWrR4LV5w2ivjeCNoaZbEr9yrhHYwm2c9pTBPHdkFI+VUwpLkeoNnfmKFEsi4gXSdB02+gr+SJ6XV6GpgPT+ywTCdbyh"
# }

# resource "aws_instance" "nginx_instances" {
#   count = 3
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   subnet_id     = element([aws_subnet.subnet_a.id, aws_subnet.subnet_b.id, aws_subnet.subnet_c.id], count.index)
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   key_name     = aws_key_pair.my_key_pair.key_name

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("C:/Users/Al Mohanad Ilewi/Desktop/SSH_Key-Pair/my-tf-key.pem")
#     host        = self.public_ip
#   }


#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update -y",
#       "sudo amazon-linux-extras install nginx1.12 -y",
#       "sudo service nginx start",
#       "sudo chkconfig nginx on"
#     ]
#   }
# }
