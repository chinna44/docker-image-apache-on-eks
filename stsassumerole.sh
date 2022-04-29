#!/bin/bash +x

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

CREDDOC=$(aws sts assume-role --role-arn "arn:aws:iam::444843055205:role/jenkins_role" --role-session-name jenkins-execution-role)
export AWS_ACCESS_KEY_ID=$( echo "${CREDDOC}" | jq -r '.Credentials.AccessKeyId' )
export AWS_SECRET_ACCESS_KEY=$( echo "${CREDDOC}" | jq -r '.Credentials.SecretAccessKey' )
export AWS_SESSION_TOKEN=$( echo "${CREDDOC}" | jq -r '.Credentials.SessionToken' )
