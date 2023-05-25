#!/bin/bash
tag=`git rev-parse -short=10 HEAD | tail -n +2`
echo $tag
DB_NAME="postgres"
date=$(date '+%Y:%m:%d-%H:%M')
environment="env_temp"
env_srv="env_service"
# Set the username and password for the database
DB_USERNAME="postgres"
DB_PASSWORD="imip@2022"
DB_HOST="192.168.2.208"
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p 5432 -U postgres -d $DB_NAME -c "INSERT INTO ai_metrics  (env, idcommit, nameservice, date) VALUES ('$environment', '$tag', '$env_srv', '$date');"
