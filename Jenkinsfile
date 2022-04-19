pipeline {
    agent any 
    stages {
        stage('Checkout'){
            steps{
                git branch:'master' , url: 'https://github.com/sharathcre/devops.git'
            }
        }
        stage('Unit Testing') {
            steps {
                echo'Unit Testing'
                sh'mvn test'
            }
        }
        stage('Sonar Analysis') {
            steps {
                echo'Sonar Analysis'
                sh'mvn sonar:sonar \
                    -Dsonar.host.url=http://35.173.232.225:9000 \
                    -Dsonar.login=01a0f7409659f9e0ed9f9f22581a537b07280794'
            }
        }
        stage('Docker Build') {
            steps {
                echo'Docker Build'
                sh'docker build -t calculator:latest .'
                sh'docker tag calculator sharathcre/calculator:$BUILD_NUMBER'
            }
        }
        stage('Publish Artifact to Nexus') {
            steps {
                echo'Publish Artifact to Nexus'
                sh'mvn deploy'
            }
        }
        stage('Run Docker container on Jenkins') {
            steps {
                sh'docker run -d -p 6060:8080 sharathcre/calculator'
            }
        }
         stage('Publish image to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                sh 'docker push sharathcre/calculator:$BUILD_NUMBER' 
        }
                  
          }
        }
    }
}
