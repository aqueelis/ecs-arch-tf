

# module "networking" {
#     source = "./modules/networking"

#     name = "ecs-test-network"
#     cidr_block = "10.0.0.0/16"
#     azs = ["us-east-1a", "us-east-1b"]

#     public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
#     private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

#     enable_nat_gateway = true

#     tags = {
#     Environment = "dev"
#     Project     = "ecs-test"
#     }
# }


# main.tf for security group module
# module "security" {
#     source = "./modules/security"

#     #vpc_id = module.networking.vpc_id
#     vpc_id = ""  # hardicoded for testing purposes

#     tags = {
#         Environment = "dev"
#         Project     = "ecs-test"
#     }
# }

# main.tf for iam module
# module "iam" {
#     source = "./modules/iam"
#     tags = {
#         Environment = "dev"
#         Project     = "ecs-test"
#     }
# }

# main.tf for ecr module
# module "ecr" {
#     source = "./modules/ecr"
#     repository_name = "ecs-test-repo"

#     tags = {
#         Environment = "dev"
#         Project     = "ecs-test"
#     }
# }

# main.tf for ecs_cluster module
# module "ecs_cluster" {
#     source = "./modules/ecs_cluster"
#     cluster_name = "ecs-test-cluster"

#     tags = {
#         Environment = "dev"
#         Project     = "ecs-test"
#     }
# }

# main.tf for ecs_ec2_capacity module
# module "ecs_ec2_capacity" {
#     source = "./modules/ecs-ec2-capacity"
#     # cluster_name = module.ecs_cluster.cluster_name
#     # subnet_ids = module.networking.private_subnet_ids
#     # security_group_ids = [module.security.ecs_instance_sg_id]
#     # iam_instance_profile = module.iam.ecs_instance_profile_name
#     cluster_name = "DevCluster"  # hardcoded for testing purposes
#     subnet_ids = ["subnet-0145e99ad1a85115b"]  # hardcoded for testing purposes
#     security_group_ids = ["sg-0fe57a474054c5fd2"]   # hardcoded for testing purposes
#     iam_instance_profile = "ecsInstanceRole"  # hardcoded for testing purposes

#     tags = {
#         Environment = "dev"
#         Project     = "ecs-test"
#     }
# }