 pipeline {
 
 agent any
     
    stages {
        stage('Getting Project from Git') {
            steps {
                echo 'Project is downloading...'
                git branch:'main', url:'https://github.com/e-sweeney/MLOps-Docker-Jenkins.git'
  
                 }
             }
          stage('Building docker container') {
            steps {
                  sh 'docker build -t heartdisease-model .'
                  sh 'docker run -d --name model heartdisease-model'
               }
           }
            stage('Preprocessing stage') {
            steps {
                   sh 'docker container exec model python3 preprocessing.py'
               }
           }
           stage('Training stage') {
            steps {
                    sh 'docker container exec model python3 train.py'
                }
        }
        stage('Test stage') {
              steps {
                    sh 'docker container exec model python3 train.py'
                    sh 'docker container exec model python3 test.py'
                    sh 'docker ps' 
                    sh 'docker rm -f model'
                  }
               }
    }
}
