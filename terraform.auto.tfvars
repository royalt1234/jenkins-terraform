#### LT/ALB/ASG ###
region               = "us-east-1"
desired_capacity     = 1
max_size             = 3
min_size             = 1
availability_zones   = "us-east-1a"
vpc_id               = ""
name_prefix          = "alpha-lt"
image_id             = ""
instance_type        = "t2.micro"
volume_size          = 10
iam_instance_profile = "alpha-profile"
key_name             = ""
domain_name          = ""
private_zone         = "false"
sub_domain           = ""
lb_name              = "alpha-lb"
lb-tg-name           = "alpha-lb-tg"
asg_name             = "alpha-asg"