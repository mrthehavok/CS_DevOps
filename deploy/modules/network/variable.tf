#------------------------------------------------------------------------------------------------
#
#                                  Variables for VPC.
#
#------------------------------------------------------------------------------------------------

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["eu-west-1b","eu-west-1c"]
}

variable "private_subnets" {
  default = ["10.0.1.0/24"]
}

variable "public_subnets" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}



variable "environment" {
  default = "DEV"
}

variable "company_name" {
  default = "ClearScale"
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
