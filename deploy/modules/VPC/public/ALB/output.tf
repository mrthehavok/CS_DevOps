#------------------------------------------------------------------------------------------------
#
#                                       Outputs with SG
#
#------------------------------------------------------------------------------------------------


output "lb_dns_name" {
  value = module.alb.lb_dns_name
}


output "alb_target_group_arns" {
  value = module.alb.target_group_arns
}