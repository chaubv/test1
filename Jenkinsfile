pipeline {
   agent any
   environment {
      tag = sh(returnStdout: true, script: "git rev-parse -short=10 HEAD | tail -n +2")
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
		sh "docker build -t nginx_v1:test ."      

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
