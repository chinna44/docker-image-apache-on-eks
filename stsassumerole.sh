#!/bin/bash +x

CREDDOC=$(aws sts assume-role --role-arn "arn:aws:iam::444843055205:role/jenkins-ecr-role" --role-session-name jenkins-execution-role)
export AWS_ACCESS_KEY_ID=$( echo "${CREDDOC}" | jq -r '.Credentials.AccessKeyId' |  tr -d '\r' )
export AWS_SECRET_ACCESS_KEY=$( echo "${CREDDOC}" | jq -r '.Credentials.SecretAccessKey' |  tr -d '\r' )
export AWS_SESSION_TOKEN=$( echo "${CREDDOC}" | jq -r '.Credentials.SessionToken' |  tr -d '\r' )
