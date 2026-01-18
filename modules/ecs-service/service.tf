resource "aws_ecs_service" "this" {
  name = var.service_name
  cluster = var.cluster_id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count = var.desired_count
  launch_type = "EC2"

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent = 100
  placement_constraints {
    type = "distinctInstance"
  }
  tags = var.tags
}