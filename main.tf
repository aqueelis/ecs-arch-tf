

module "networking" {
    source = "./modules/networking"

    name = "ecs-test-network"
    cidr_block = "10.0.0.0/16"
    azs = ["us-east-1a", "us-east-1b"]

    public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

    enable_nat_gateway = true

    tags = {
    Environment = "dev"
    Project     = "ecs-test"
    }
}


# main.tf for security group module
module "security" {
    source = "./modules/security"

    vpc_id = module.networking.vpc_id

    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

# main.tf for iam module
module "iam" {
    source = "./modules/iam"
    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

# main.tf for ecr module
module "ecr" {
    source = "./modules/ecr"
    repository_name = "ecs-test-repo"

    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

# main.tf for ecs_cluster module
module "ecs_cluster" {
    source = "./modules/ecs_cluster"
    cluster_name = "ecs-test-cluster"

    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

# main.tf for ecs_ec2_capacity module
module "ecs_ec2_capacity" {
    source = "./modules/ecs-ec2-capacity"
    cluster_name = module.ecs_cluster.cluster_name
    subnet_ids = module.networking.private_subnet_ids
    security_group_ids = [module.security.ecs_sg_id]
    iam_instance_profile = module.iam.ecs_instance_profile
    target_group_arns = [module.alb.target_group_arn]
    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

#main.tf for alb module
module "alb" {
    source = "./modules/alb"
    name = "ecs-test-alb"
    vpc_id = module.networking.vpc_id
    public_subnet_ids = module.networking.public_subnet_ids
    security_group_ids = module.security.alb_sg_id
    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

# main.tf for ecs_service module
module "ecs_service" {
    source = "./modules/ecs-service"
    cluster_id              = module.ecs_cluster.cluster_id
    task_execution_role_arn = module.iam.ecs_task_execution_role_arn
    task_role_arn           = module.iam.ecs_task_role

    container_name  = "app"
    container_image = module.ecr.repository_url
    imageversion = "v2.0"

    target_group_arn = module.alb.target_group_arn
    service_name = "ecs-test-service"
    container_port = 5000
    desired_count = 2
    
    
    tags = {
        Environment = "dev"
        Project     = "ecs-test"
    }
}

#adding comment to test git changes