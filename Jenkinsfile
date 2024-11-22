 pipeline {
 
 agent any
     
    stages {
        stage('Getting Project from Git') {
            steps {
                echo 'Project is downloading...'
                git branch:'main', url:'https://github.com/e-sweeney/MLOps-Docker-Jenkins.git'
  
                 }
             }
          
        stage('Build & Run stage') {
              steps {
                    sh 'usermod -aG docker root'
                    sh 'docker build -t heartdisease-model .'
                    sh 'docker run -d --name model heartdisease-model'
                    
                  }
               }
    }
}
