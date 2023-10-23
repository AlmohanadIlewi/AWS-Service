resource "aws_lb" "application_loadbalancer" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id, aws_subnet.subnet_c.id]

  tags = {
    Name = "My Load Balancer"
  }
}

resource "aws_lb_target_group" "target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id


health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "EC1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.EC1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "EC2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.EC2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "EC3" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.EC3.id
  port             = 80
}

























# # Fügen Sie hier den Load-Balancer-Code hinzu
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
# resource "aws_lb" "application_loadbalancer" {
#   name               = "loadbalancer"
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.sg.id]
#   subnets            = [aws_subnet.subnet[0].id, aws_subnet.subnet[1].id, aws_subnet.subnet[2].id]
#   ip_address_type    = "ipv4"

#   tags = {
#     Name = "My Load Balancer"
#   }
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
# resource "aws_lb_target_group" "targetgroup" {
#   target_type = "instance"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.main.id

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     port                = "80"
#     protocol            = "HTTP"
#     timeout             = 3
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
# resource "aws_lb_listener" "application_loadbalancer_listener" {
#   load_balancer_arn = aws_lb.application_loadbalancer.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.targetgroup.arn
#   }
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment
# resource "aws_lb_target_group_attachment" "instance_a" {
#   target_group_arn = aws_lb_target_group.targetgroup.arn
#   target_id        = aws_instance.test[0].id
#   port             = 80
# }
# resource "aws_lb_target_group_attachment" "instance_b" {
#   target_group_arn = aws_lb_target_group.targetgroup.arn
#   target_id        = aws_instance.test[1].id
#   port             = 80
# }
# resource "aws_lb_target_group_attachment" "instance_c" {
#   target_group_arn = aws_lb_target_group.targetgroup.arn
#   target_id        = aws_instance.test[2].id
#   port             = 80
# }