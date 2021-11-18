#------------------------------------------------------------------------------------------------
#
#                                       Outputs with SG
#
#------------------------------------------------------------------------------------------------


output "sg_id" {
  value = aws_security_group.web.id
}

output ami {
    value = data.aws_ami.ami.id
}



output asg_id {
    value = aws_autoscaling_group.web.id
}