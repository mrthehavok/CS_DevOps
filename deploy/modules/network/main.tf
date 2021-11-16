#------------------------------------------------------------------------------------------------
#                                         VPC
#------------------------------------------------------------------------------------------------

//  All info about module you can find in https://github.com/terraform-aws-modules/terraform-aws-vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.environment}-vpc-for-${var.company_name}"
  cidr = var.cidr_block

  azs               = var.azs
  private_subnets   = var.private_subnets
  public_subnets    = var.public_subnets

  enable_nat_gateway = true


  tags = var.common_tags
}