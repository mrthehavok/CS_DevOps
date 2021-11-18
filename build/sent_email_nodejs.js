// https://stackabuse.com/publishing-and-subscribing-to-aws-sns-messages-with-node-js/
const express = require('express');
const app = express();

const AWS = require('aws-sdk');
const credentials = new AWS.SharedIniFileCredentials({profile: 'default'});
const sns = new AWS.SNS({credentials: credentials, region: 'eu-west-1'});

const port = 3000;

app.use(express.json());

app.get('/status', (req, res) => res.json({status: "ok", sns: sns}));

app.listen(port, () => console.log(`SNS App listening on port ${port}!`));

app.post('/subscribe', (req, res) => {
    let params = {
        Protocol: 'EMAIL',
        TopicArn: 'arn:aws:sns:eu-west-1:521283757875:clearscale',
        Endpoint: req.body.email
    };

    sns.subscribe(params, (err, data) => {
        if (err) {
            console.log(err);
        } else {
            console.log(data);
            res.send(data);
        }
    });
});

app.post('/send', (req, res) => {
    let params = {
        Message: req.body.message,
        Subject: req.body.subject,
        TopicArn: 'arn:aws:sns:eu-west-1:521283757875:clearscale'
    };

    sns.publish(params, function(err, data) {
        if (err) console.log(err, err.stack); 
        else console.log(data);
    });
});

app.post('/send', (req, res) => {
    let now = new Date().toString();
    let email = `${req.body.message} \n \n This was sent: ${now}`;
    let params = {
        Message: email,
        Subject: req.body.subject,
        TopicArn: 'arn:aws:sns:eu-west-1:521283757875:clearscale'
    };

    sns.publish(params, function(err, data) {
        if (err) console.log(err, err.stack); 
        else console.log(data);
    });
});