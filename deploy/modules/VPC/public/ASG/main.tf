#------------------------------------------------------------------------------------------------
#
#               Module for creating rollback deployment  in public subnets
#
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------

// Get latest AMI for LС
data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["self"]
}


#------------------------------------------------------------------------------------------------
#                                        Create SG
#------------------------------------------------------------------------------------------------
resource "aws_security_group" "web" {
  name = "Dynamic Security Group"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      description       = "${ingress.value} from dynamic terraform"
      from_port         = ingress.value
      to_port           = ingress.value
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic SecurityGroup"
    Owner = "idmitriev"
  }
}



#------------------------------------------------------------------------------------------------
#                                        Create ASG
#------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "web" {
  //  name            = "WebServer-Highly-Available-LC"
  name_prefix           = "WebServer-Highly-Available-LC-"
  image_id              = data.aws_ami.ami.id
  instance_type         = "t2.micro"
  security_groups       = [aws_security_group.web.id]
  iam_instance_profile  = "web_instance_profile"


  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_autoscaling_group" "web" {
  name                 = "ASG-${aws_launch_configuration.web.name}"
  launch_configuration = aws_launch_configuration.web.name
  min_size             = var.min_asg_size
  max_size             = var.max_asg_size
  desired_capacity     = var.des_asg_size
  health_check_type    = "EC2"
  force_delete         = true
  target_group_arns    = [var.alb_target_group_arns]
#  vpc_zone_identifier  = [var.subnet_id[0],var.subnet_id[1]]
  vpc_zone_identifier  = [for id in var.public_subnets : id]
#  load_balancers       = [aws_alb.web.name]
#  target_group_arns = [aws_alb.web.arn]


  dynamic "tag" {
    for_each = {
      Name   = "WebServer in ASG"
      Project   = "DevOps_CS_task" 
      Created   = "By Terraform" 
      Owner     = "idmitriev"      
      TAGKEY = "TAGVALUE"
    }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }


#tags = var.common_tags

  lifecycle {
    create_before_destroy = true
  }
}


