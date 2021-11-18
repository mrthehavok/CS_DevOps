from flask import Flask,  redirect, render_template, request, url_for
import boto3

# Variables
AWS_REGION="eu-west-1"



sns = boto3.client("sns", region_name=AWS_REGION)
ssm = boto3.client('ssm',region_name=AWS_REGION)
parameter = ssm.get_parameter(Name='/DEV/SNS_ARN')
RECIPIENT = parameter['Parameter']['Value']




app = Flask(__name__)

@app.route('/')
def index():
    """ A view that renders the Send EMAIL form. """
    return render_template('index.html')

@app.route('/send_sms', methods=['POST'])
def send_sms():
    """ A POST endpoint that sends an EMAIL. """

    # Extract the form values:
    message = request.form['message']

    result = sns.publish(TopicArn=RECIPIENT,
            Message=message,
            Subject="SNS TEST")



    # Redirect the user back to the form:
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(
        host = "0.0.0.0",
        port = 80,
        debug = True
    )