![example workflow](https://github.com/mrthehavok/CS_DevOps/workflows/CI_CD/badge.svg)


# Description 
It's fully automated project via CI/CD which create simple web page in AWS stack.

**Input**
None

**Output**
Application load balancer DNS

## Project tree 
```
.
├── README.md
├── app
│   ├── application.py
│   ├── index.html
│   ├── test_scripts
│   │   ├── send_email_ses.py
│   │   └── send_email_sns.py
│   └── web_flask.service
├── build
│   ├── ami.json
│   ├── presetup.sh
│   ├── setup.sh
│   └── variables.json
└── deploy
    ├── dev.auto.tfvars
    ├── main.tf
    ├── modules
    │   ├── IAM
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── SSM_SNS
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── VPC
    │   │   └── public
    │   │       ├── ALB
    │   │       │   ├── main.tf
    │   │       │   ├── output.tf
    │   │       │   └── variables.tf
    │   │       └── ASG
    │   │           ├── main.tf
    │   │           ├── outputs.tf
    │   │           └── variables.tf
    │   └── network
    │       ├── main.tf
    │       ├── output.tf
    │       └── variable.tf
    ├── output.tf
    └── variables.tf
```

# Stack 
## app
#### Description
Simple web page for sending message using AWS SNS. SNS topic store in SSM parameter store.

#### Technologies
1. [python3](https://docs.python.org/3/)
2. [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
3. [flask](https://flask.palletsprojects.com/en/2.0.x/)



## build
#### Description
Build AWS AMI using github actions.

#### Technologies
1. [github actions](https://docs.github.com/en/actions)
2. [packer](https://www.packer.io/docs)


## deploy
#### Description
Create infrastracture using github actions and terraform:

- VPC and Network
- - VPC
- - 2 public subnet
- - 1 private subnet
- - Minimal required amount of resources (IGW,EIP,NAT, routing)
- Application
- - Auto Scaling Group (single micro EC2 instance)
- - Launch Configuration
- - ALB
- - IAM Role (access to Parameter Store and SNS services)
- - SNS topic & sub
- - SSM parameter

#### Technologies
1. [AWS](https://docs.aws.amazon.com/)
2. [terraform](https://www.terraform.io/docs/index.html)
3. [setup-terraform](https://github.com/hashicorp/setup-terraform)

## Prerequisites
- AWS account
- Terraform cloud account

## Installation instructions
1. Configure TF_API_TOKEN , AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY for your Terraform cloud account - [Instruction](https://learn.hashicorp.com/tutorials/terraform/github-actions).
2. Configure AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY for your secret github sections -  [Instruction](https://docs.github.com/en/actions/security-guides/encrypted-secrets).
3. **For first run (initialization)** just push repo.
4. **For first run (initialization)** Confirm subscribe.
5. If you want change any config just change required in main branch and push. All steps are automated.

## External module info
### Terraform
- VPC was build using  [terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc)
- ALB was build using  [terraform-aws-alb](https://github.com/terraform-aws-modules/terraform-aws-alb)

### Github Actions
- Checks-out your repository [actions/checkout](https://github.com/marketplace/actions/checkout)
- Pack you build to AWS AMI [ExitoLab/packer_build_action_aws](https://github.com/marketplace/actions/packer-build-on-aws)
- Set up Terraform CLI [hashicorp/setup-terraform](https://github.com/marketplace/actions/hashicorp-setup-terraform)


