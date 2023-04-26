pipeline {
   agent none
   environment {
        tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }	
   stages {
      stage('Build Image') {
	     when {
             branch 'main'
            }
         agent {
             node {
                  label 'dev-k8s'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }
         steps {
               sh "docker build -t nginx_v1:${tag} ."
           }
       }
	   
      stage('Deploy Image') {
        steps {
	      input 'Do you approve deployment?'	
              echo "Deploying Code"
   
          }
      }
   }
}
