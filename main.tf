

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