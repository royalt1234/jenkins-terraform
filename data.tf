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

data "aws_route53_zone" "alpha" {
  name         = var.domain_name
  private_zone = var.private_zone
}