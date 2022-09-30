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

### For the instance profile needed for teh Launch Template ###
resource "aws_iam_instance_profile" "alpha" {
  name = var.iam_instance_profile
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "alpha_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

### security groups !!!!! i opened access to all ports on both the lb and lt security groups. EDIT AS PER REQUIREMENTS ####

output "aws_security_group" {
  value = aws_security_group.sg.id
}

resource "aws_security_group" "sg" {
  name = "load-balancer-sg"
  description = "load balancer security group"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_security_group" "sg-1" {
  name = "launch-template-sg"
  description = "launch template security group"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = data.aws_vpc.vpc.id
}

output "aws_security_group-1" {
  value = aws_security_group.sg-1.id
}