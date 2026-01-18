# ecs-arch-tf
Terraform modular code for deploying ECS architecture in AWS

## Overview
This repository contains modular Terraform configurations for deploying a complete ECS (Elastic Container Service) infrastructure on AWS, including networking, load balancing, container services, and auto-scaling.

## Prerequisites
- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Docker (for building container images)

## Architecture
- VPC with public and private subnets
- Application Load Balancer
- ECS Cluster with Fargate launch type
- CloudWatch monitoring and logging
- Auto Scaling Groups

## Project Structure
```
├── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── alb/
│   └── auto_scaling/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

## Usage
1. Clone the repository
2. Navigate to your desired environment directory
3. Initialize Terraform: `terraform init`
4. Plan deployment: `terraform plan`
5. Apply configuration: `terraform apply`

## Outputs
Key infrastructure outputs including ALB DNS, ECS cluster name, and service endpoints.
