resource "aws_launch_template" "alpha-template" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.aws_security_group-1]

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.volume_size
    }
  }

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  key_name = var.key_name

  placement {
    availability_zone = var.availability_zones
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = ""
      value = "Jenkins/Databricks"
    }

  }

  user_data = filebase64("${path.module}/jenkins_install.sh")
}

