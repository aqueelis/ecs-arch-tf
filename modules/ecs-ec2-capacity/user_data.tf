locals {
  ecs_user_data = <<EOF
  #!/bin/bash
  echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config
  EOF
}