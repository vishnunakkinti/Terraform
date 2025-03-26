terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
module "S3" {
    source = "./Modules/S3"

    bucket_name = var.bucket_name
  
}

module "DynamoDB" {
    source = "./Modules/DynamoDB"
    
    aws_dynamodb_table = var.aws_dynamodb_table 
    
}
module "VPC" {
  source = "./Modules/VPC"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  cluster_name         = var.cluster_name
}

module "EKS" {
  source = "./Modules/EKS"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  node_groups     = var.node_groups
}