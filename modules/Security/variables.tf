variable "iam_instance_profile" {
  type = string
  description = "name of instance profile"
}

variable "vpc_id" {}

variable "aws_security_group" {
  type = string
  description = "output of the security group id"
}