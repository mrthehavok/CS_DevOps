#------------------------------------------------------------------------------------------------
#                                         Global variables
#------------------------------------------------------------------------------------------------
region_name         = "eu-west-1"
project_name        = "DevOps_CS_task"


common_tags         = {
                        Project     = "DevOps_CS_task"
                        Created     = "By Terraform"
                        Owner       = "idmitriev"
                        Environment = "Development"
                        Company     = "ClearScale"
                        }
company_name        = "ClearScale"                        
environment         = "DEV"


#------------------------------------------------------------------------------------------------
#                                         Network variables
#------------------------------------------------------------------------------------------------

cidr_block          =   "10.0.0.0/16"  
public_subnets      =   ["10.0.11.0/24","10.0.12.0/24"]
private_subnets     =   ["10.0.1.0/24"]
email_address       =   "havok16121989@gmail.com"