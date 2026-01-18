resource "aws_autoscaling_group" "this" {
  name = "ecs-asg-${var.cluster_name}"
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id = aws_launch_template.this.id
    version = "$Latest"
  }
  tag {
    key = "Name"
    value = "ecs-instance"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}