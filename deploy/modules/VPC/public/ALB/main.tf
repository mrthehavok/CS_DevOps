#------------------------------------------------------------------------------------------------
#
#                                       Module for creating ALB
#
#------------------------------------------------------------------------------------------------


module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.environment}-ALB-for-${var.company_name}"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.public_subnets
  security_groups    = [var.sg_id]


  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
/*
      targets = [
        {
          target_id = "i-043ab627a371e414e"
          port = 80
        }
      ]
 */     
    }
  ]


  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = var.common_tags
}