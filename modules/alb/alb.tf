resource "aws_lb" "this" {
  name = var.name
  load_balancer_type = "application"
  internal = false
  subnets = var.public_subnet_ids
  security_groups = [var.security_group_ids]

  tags = merge(var.tags, {
    Name = var.name
  })
}