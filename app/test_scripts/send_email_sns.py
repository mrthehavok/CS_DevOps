# aws sns publish     --topic-arn "arn:aws:sns:eu-west-1:521283757875:clearscale"     --message "SNS"

AWS_REGION="eu-west-1"

import boto3
sns = boto3.client("sns", region_name=AWS_REGION)

ssm = boto3.client('ssm',region_name=AWS_REGION)
parameter = ssm.get_parameter(Name='/DEV/TEST_SNS')
RECIPIENT = parameter['Parameter']['Value']

sns.publish(TopicArn=RECIPIENT,
            Message="SNS TEST",
            Subject="SNS TEST")
