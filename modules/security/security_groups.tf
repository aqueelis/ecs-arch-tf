
#ALB Security Group
resource "aws_security_group" "alb_sg" {
    name        = "alb_sg"
    description = "Security group for ALB"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(var.tags, {
        "Name" = "alb_sg"
    })
}

#ECS Security Group
resource "aws_security_group" "ecs_sg" {
    name        = "ecs_sg"
    description = "Security group for ECS tasks"
    vpc_id      = var.vpc_id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(var.tags, {
        "Name" = "ecs_sg"
    })
}