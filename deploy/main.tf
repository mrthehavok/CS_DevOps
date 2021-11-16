provider "aws" {
  region = var.region_name
}



/*
terraform {
  backend "s3" {
    bucket = "idmitriev.clearscale.test"
    key    = "DevOps_CS_task/terraform.tfstate"
    region = "eu-west-1"
  }
}
*/

terraform {
       backend "remote" {
         organization = "idmitriev"
         workspaces {
           name = "DevOps_clearscale"
         }
       }
     }
/*
locals {
  public_subnets  = module.vpc.public_subnets
  identifier      = lower("${var.environment}-${var.company_name}")
}
*/



data "aws_availability_zones" "working" {}



module "iam" {
  source          = "./modules/IAM"
}

module "SSM_SNS" {
  source          = "./modules/SSM_SNS"
  email_address   = var.email_address
}


module "vpc" {
  source          = "./modules/network"
  cidr_block =      var.cidr_block
  azs             = data.aws_availability_zones.working.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  common_tags     = var.common_tags
  environment     = var.environment
}


module "alb" {
  source          = "./modules/VPC/public/ALB"
  public_subnets= module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id
  common_tags   = var.common_tags
  sg_id         = module.asg.sg_id
}

module "asg" {
  source          = "./modules/VPC/public/ASG"
  des_asg_size  = var.des_asg_size
  max_asg_size  = var.max_asg_size
  min_asg_size  = var.min_asg_size
  public_subnets= module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id
  alb_target_group_arns = module.alb.alb_target_group_arns[0]
  common_tags   = var.common_tags
  
}


#------------------------------------------------------------------------------------------------
#                                        Attach ASG to ALB
#------------------------------------------------------------------------------------------------

/*
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = module.asg.asg_id
  alb_target_group_arn   = module.alb.alb_target_group_arns[0]
}
*/
