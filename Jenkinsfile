pipeline {
   agent none
   stages {
      stage('Build Image') {
	     when {
             branch 'main'
            }
      environment {
        tag = sh(returnStdout: true, script: "git rev-parse -short=10 HEAD | tail -n +2")
      }	      
      agent {
             node {
                  label 'dev-k8s'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }
	   
       steps {
		  sh "docker build -t nginx ."
	       sh "docker tag nginx:latest 198927737561.dkr.ecr.ap-southeast-1.amazonaws.com/abc-test:${tag}" 
	       sh "ed -i "s@dev@tag@g" test.yaml"

              }
       }
	   
      stage('Deploy Image') {
	agent {
             node {
                  label 'k8s'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }      
        steps {
	      input 'Do you approve deployment?'	
              echo "Deploying Code"
	      sh "ls -la"	
   
          }
      }
   }
}
