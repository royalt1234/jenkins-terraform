### VPC #####

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

resource "aws_lb" "alpha-lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.aws_security_group]
  subnets            = data.aws_subnets.subnet.ids

  # enable_deletion_protection = true

  tags = {
    Environment = "alpha"
  }
}

resource "aws_lb_target_group" "alpha" {
  name     = var.lb-tg-name
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_listener" "alpha-listener" {
  load_balancer_arn = aws_lb.alpha-lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.alpha.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alpha.arn
  }
}

resource "aws_lb_listener_rule" "rule-listener" {
  listener_arn = aws_lb_listener.alpha-listener.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alpha.arn
  }

  condition {
    host_header {
      values = [var.sub_domain]
    }
  }
}