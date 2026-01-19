resource "aws_ecs_task_definition" "this" {
  family = var.service_name
  requires_compatibilities = ["EC2"]
  network_mode = "default"
  cpu = var.cpu
  memory = var.memory
  execution_role_arn = var.task_execution_role_arn
  task_role_arn = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])
    tags = var.tags
}