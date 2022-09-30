variable "aws_lb_target_group" {}

variable "domain_name" {
  type = string
  description = "domain name which already exist"
}

variable "asg_name" {
  type = string
  description = "autoscaling group name"
}

variable "desired_capacity" {}

variable "private_zone" {
  type = string
  description = "if the hosted zone is private or public. Values can only be true or false"
}

variable "sub_domain" {
  type = string
  description = "sub domain"
}

variable "lb_name" {
  type = string
  description = "name of load balancer"
}

variable "lb-tg-name" {
  type = string
  description = "name of load balancer target group"
}

variable "vpc_id" {}

variable "availability_zones" {
  type = string
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "alpha-template" {
  type = string
}

variable "aws_security_group" {
  type = string
  description = "output of the security group id"
}
