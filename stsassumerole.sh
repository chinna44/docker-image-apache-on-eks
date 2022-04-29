#!/bin/bash +x

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
unset AWS_SECURITY_TOKEN

export AWS_ACCESS_KEY_ID=${aws_access_key_id}
export AWS_SECRET_ACCESS_KEY=${aws_secret_access_key}

CREDDOC=$(aws sts assume-role --role-arn "arn:aws:iam::444843055205:role/jenkins_role" --role-session-name jenkins-assume-execution-role)
export AWS_ACCESS_KEY_ID=$( echo "${CREDDOC}" | jq -r '.Credentials.AccessKeyId' |  tr -d '\r' )
export AWS_SECRET_ACCESS_KEY=$( echo "${CREDDOC}" | jq -r '.Credentials.SecretAccessKey' |  tr -d '\r' )
export AWS_SESSION_TOKEN=$( echo "${CREDDOC}" | jq -r '.Credentials.SessionToken' |  tr -d '\r' )
