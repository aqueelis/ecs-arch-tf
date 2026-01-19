terraform { 
  cloud { 
    
    organization = "arm-org" 

    workspaces { 
      name = "arm-ecs" 
    } 
  } 
}

provider "aws" {
  region = "us-east-1"
}