#------------------------------------------------------------------------------------------------
#
#                                       Outputs with SG
#
#------------------------------------------------------------------------------------------------


output "sg_id" {
  value = aws_security_group.web.id
}

/*
data "aws_instances" "asg" {
  instance_tags = {
    Project = "DevOps_CS_task"
  }

  instance_state_names = ["running", "stopped"]
}

output instance_id {
    value = data.aws_instances.asg.ids
}
*/

output ami {
    value = data.aws_ami.ami.id
}



output asg_id {
    value = aws_autoscaling_group.web.id
}