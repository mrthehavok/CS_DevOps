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
/*
cidr_block          =   "10.0.0.0/16"  
azs                 =   ["eu-west-1a","eu-west-1b","eu-west-1c"]
private_subnets     =   ["10.0.1.0/24"]
public_subnets      =   ["10.0.11.0/24","10.0.12.0/24"]
#bucket_name         =   "idmitriev.clearscale.test"
*/

cidr_block          =   "10.0.0.0/16"  
azs                 =   ["eu-west-1a","eu-west-1b","eu-west-1c"]
public_subnets      =   ["10.0.11.0/24","10.0.12.0/24"]
private_subnets     =   ["10.0.1.0/24"]