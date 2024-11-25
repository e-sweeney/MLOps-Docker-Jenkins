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
                  script{ 
                    docker.build("heartdisease-model:latest", ".")
                  }  
                  }
               }
        stage('Run stage') {
              steps {
                  script{ 
                   img = "heartdisease-model:latest"
                    docker.img("${img}").run('-d --name model')
                  }  
                  }
               }
        stage('Preprocessing stage') {
            steps {
                script {
                  sh 'docker exec model python3 preprocessing.py'
                }
               }
           }
        stage('Training stage') {
            steps {
                script{
                    sh 'docker exec model python3 train.py'
                }
              }
        }
        stage('Test stage') {
              steps {
                  script{
                   
                    sh 'docker container exec model python3 test.py'
                  }
              }
        }
    }
}
