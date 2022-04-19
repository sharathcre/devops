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
                sh'mvn clean test'
            }
        }
        stage('Sonar Analysis') {
            steps {
                echo'Sonar Analysis'
                sh'mvn sonar:sonar \
  -Dsonar.host.url=http://54.234.141.174:9000 \
  -Dsonar.login=9cf92745d2da1e153656da0f9fd7be3577c2e2fb'
            }
        }
        stage('Docker Build') {
            steps {
                echo'Docker Build'
                sh'mvn clean package'
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
        stage('Publish image to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                sh 'docker push sharathcre/calculator:$BUILD_NUMBER' 
        }
        stage('Run Docker container on Remote host') {
            steps {
                sh'docker run -d -p 6060:8080 sharathcre/calculator'
            }
        }             
          }
        }
    }
}
