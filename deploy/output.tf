#------------------------------------------------------------------------------------------------
#
#                             Output for root module
#
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#                                         Network
#------------------------------------------------------------------------------------------------


output "vpc_id" {
  value = module.vpc.vpc_id	
}


output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block	
}


output "public_subnets" {
  value = module.vpc.public_subnets
}

output "sg_id" {
  value = module.asg.sg_id
}

/*
output instance_id {
    value = module.asg.instance_id
}
*/

/*
output lb_dns_name {
    value = module.alb.lb_dns_name
}
*/