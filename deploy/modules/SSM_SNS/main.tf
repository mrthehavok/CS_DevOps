#------------------------------------------------------------------------------------------------
#
#                            Module for SSM & SNS
#
#------------------------------------------------------------------------------------------------



/*
resource "aws_ssm_parameter" "email" {
  name        = "/${var.environment}/SES"
  description = "Email address for SES"
  type        = "String"
  value       = var.email_address
  tags        = var.common_tags
}
*/


resource "aws_sns_topic" "CS_DevOps" {
  name = "CS_DevOps"
}


resource "aws_sns_topic_subscription" "sns_sub" {
  topic_arn = aws_sns_topic.CS_DevOps.arn
  protocol  = "email"
  endpoint  = var.email_address
}


resource "aws_ssm_parameter" "SNS_topic" {
  name        = "/${var.environment}/SNS_ARN"
  description = "ARN for SNS topic"
  type        = "String"
  value       = aws_sns_topic.CS_DevOps.arn
  tags        = var.common_tags
}

