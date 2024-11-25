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
                   img = "docker.io/library/heartdisease-model:latest"
                    docker.image("${img}").run('-d --name model')
                  }  
                  }
        } 
        stage('Stop stage') {
              steps {
                  script{
                    sh 'docker exec model python3 preprocessing.py'
                    sh 'docker exec model python3 train.py'
                    sh 'docker exec model python3 test.py'
                    sh 'docker stop model'
                    
                  }
              }
        }

    }
}
