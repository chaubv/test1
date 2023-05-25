#!/bin/bash
tag=`git rev-parse -short=10 HEAD | tail -n +2`
echo $tag
echo $params.appEnv 
sed -i s/dev/${tag}/g /home/ubuntu/jenkins/multi-branch/test.yaml
