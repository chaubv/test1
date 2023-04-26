pipeline {
   agent none
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
               sh "docker build -t nginx_v1 ."
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
