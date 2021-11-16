#------------------------------------------------------------------------------------------------
#
#                                  Variables for SSM .
#
#------------------------------------------------------------------------------------------------



variable "environment" {
  default = "DEV"
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

variable "email_address" {
  default = "havok16121989@gmail.com"
}