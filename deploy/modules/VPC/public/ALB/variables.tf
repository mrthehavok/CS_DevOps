#------------------------------------------------------------------------------------------------
#                                         Global variables
#------------------------------------------------------------------------------------------------

variable "environment" {
  default = "DEV"
}

variable "region_name" {
  default = "eu-west-1"
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

variable "company_name" {
  default = "ClearScale"
}


variable "vpc_id" {
  default = ""
}

variable "public_subnets" {
  default = ""
}

variable "sg_id" {
  default = ""
}

variable "instance_id" {
  default = ""
}
