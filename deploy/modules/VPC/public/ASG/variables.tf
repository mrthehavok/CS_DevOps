#------------------------------------------------------------------------------------------------
#
#                                      Variables for ASG size
#
#------------------------------------------------------------------------------------------------

variable "min_asg_size" {
  default = 1
}

variable "max_asg_size" {
  default = 3
}

variable "des_asg_size" {
  default = 2
}

variable "vpc_id" {
  default = ""
}

variable "public_subnets" {
  default = ""
}

variable "common_tags" {
    default = {
                        Project     = "DevOps_CS_task"
                        Created     = "By Terraform"
                        Owner       = "idmitriev"
                        Environment = "Development"
                        Company     = "ClearScale"
                        
    }
}

variable "key_name" {
  default = "idmitriev-key-ireland.pem"
}

variable "environment" {
  default = "DEV"
}

variable "allow_ports" {
  description = "List of ports to open to server "
  default = ["80" , "443", "22" ]
}

variable "company_name" {
  default = "ClearScale"
}



variable "role_name" {
  default = "clearscale"
}

variable "alb_target_group_arns" {
  default = ""
}