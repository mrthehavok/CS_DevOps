#------------------------------------------------------------------------------------------------
#
#                            Module for SSM
#
#------------------------------------------------------------------------------------------------




resource "aws_ssm_parameter" "email" {
  name        = "/${var.environment}/SES"
  description = "Email address for SES"
  type        = "String"
  value       = var.email_address
  tags        = var.common_tags
}