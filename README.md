<img src="https://github.com/mrthehavok/CS_DevOps/workflows/CI_CD/badge.svg?branch=mastersd"><br>

# Description 
- I’m surprised at how many times I land on a project page that is obviously popular (because Twitter told me so) but I have no idea why because the project owners don’t tell me plainly what the project is or why I should care.
# Installation instructions
- Tell me where to get the bits and how to install them
# Where to get help 
- Link to the docs, mailing list, wiki, etc.
# Contribution guidelines 
- Tell me how I can help out including wanted features and code standards
# Contributor list 
- List the humans behind the project
# Credits, Inspiration, Alternatives 
- Tell me if this is a fork of or otherwise inspired by another project. I won’t think you’re a douche when I find out later.

## Project tree 
```
├── README.md
├── app
│   └── index.html
├── build
│   ├── ami.json
│   ├── index.html
│   ├── send_email.py
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
    │   │           ├── user_data.sh
    │   │           └── variables.tf
    │   └── network
    │       ├── main.tf
    │       ├── output.tf
    │       └── variable.tf
    ├── output.tf
    └── variables.tf

```
