### LT/ALB/ASG ###
# variable "bucket_name" {
#   type        = string
#   description = "name of s3 bucket for backend state"
# }

# variable "dynamodb_name" {
#   type        = string
#   description = "name of the dynamo db for loack table"
# }

variable "region" {
  type =string
}

variable "vpc_id" {}

variable "asg_name" {
  type        = string
  description = "autoscaling group name"
}

variable "desired_capacity" {
  type        = number
  description = "number of desired capacity"
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "availability_zones" {
  type = string
}

variable "name_prefix" {
  type        = string
  description = "name of launch template"
}

variable "image_id" {
  type        = string
  description = "ami to use"
}

variable "instance_type" {
  type        = string
  description = "your preferred instance type"
}

variable "key_name" {
  type        = string
  description = "your keypair name"
}

variable "volume_size" {
  type        = number
  description = "volume size of your ebs volume"
}

variable "domain_name" {
  type        = string
  description = "domain name which already exist"
}

variable "private_zone" {
  type        = string
  description = "if the hosted zone is private or public. Values can only be true or false"
}

variable "sub_domain" {
  type        = string
  description = "sub domain"
}

variable "lb_name" {
  type        = string
  description = "name of load balancer"
}

variable "lb-tg-name" {
  type        = string
  description = "name of load balancer target group"
}

variable "iam_instance_profile" {
  type        = string
  description = "name of instance profile"
}