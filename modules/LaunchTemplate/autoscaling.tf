resource "aws_autoscaling_group" "alpha" {
  name               = var.asg_name
  availability_zones = [var.availability_zones]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  health_check_type  = "ELB"
  # vpc_zone_identifier = data.aws_subnets.subnet.id

  launch_template {
    id      =  var.alpha-template
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_alpha" {
  autoscaling_group_name = aws_autoscaling_group.alpha.id
  lb_target_group_arn    = var.aws_lb_target_group
}

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