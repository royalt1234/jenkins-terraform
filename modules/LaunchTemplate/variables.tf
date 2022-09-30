variable "region" {
  type = string
  description = "name of the region"
}

variable "alpha-template" {}

variable "name_prefix" {
  type = string
  description  = "name of launch template"
}

variable "image_id" {
  type = string
  description = "ami to use"
}

variable "instance_type" {
  type = string
  description = "your preferred instance type"
}

variable "key_name" {
  type = string
  description = "your keypair name"
}

variable "availability_zones" {
  type = string
}

variable "volume_size" {
  type = string
  description = "volume size of your ebs volume"
}

variable "aws_lb_target_group" {}

variable "vpc_id" {}

variable "subnet_id" {
  ##### 1st subnet_id here ####
}

variable "asg_name" {
  type = string
  description = "autoscaling group name"
}

variable "desired_capacity" {
  type = number
  description = "number of desired capacity"
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "aws_security_group-1" {
  type = string
  description = "output of the security group id"
}

variable "iam_instance_profile" {}