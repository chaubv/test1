pipeline {
   agent none
   stages {
      stage('Build Image') {
	     when {
             branch 'main'
            }
       environment {
      tag = sh(returnStdout: true, script: "git rev-parse HEAD | cut -c1-7")
    }	      
         agent {
             node {
                  label 'dev-k8s'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }
	   
         steps {
		  sh "docker build -t nginx:${tag} ."      

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
