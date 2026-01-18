data "aws_ami" "ecs" {
  most_recent = true
  owners = ["amazon"]

filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
    }
}

resource "aws_launch_template" "this" {
  name_prefix = "ecs-launch-template-"
  image_id = data.aws_ami.ecs.id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.iam_instance_profile
}
  network_interfaces {
    security_groups = var.security_group_ids
    subnet_id       = element(var.subnet_ids, 0)
    associate_public_ip_address = true
  }

  user_data = base64encode(local.ecs_user_data)

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
        Name = "ecs-instance"
    })
  }
}