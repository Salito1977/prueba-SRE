terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

module "networking" {
  source = "./modules/networking"  
}

module "rds-potgres" {
  source = "./modules/rds-pg"
  subnets = [module.networking.subnet_data1_id, module.networking.subnet_data2_id]
  vpc_id = module.networking.vpc_id
  wordpress_rdb_sg_id = module.networking.wordpress_rdb_sg_id
}

module "ec2" {
  source = "./modules/ec2"
  subnets = [module.networking.subnet1_id, module.networking.subnet2_id]
  wordpress_sg_id = module.networking.wordpress_sg_id
}