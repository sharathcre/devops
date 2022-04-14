pipeline {
    agent any 
    stages {
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
        stage('Build Artifact') {
            steps {
                echo'Build Artifact'
                sh'mvn clean package'
            }
        }
        stage('Publish Artifact to Nexus') {
            steps {
                echo'Publish Artifact to Nexus'
                sh'mvn deploy'
            }
        }
        stage('Deploy Artifact on Tomcat') {
            steps {
                echo'Deploying'
                script {
                    deploy adapters: [tomcat7(credentialsId: 'TOMCAT', path: '', url: 'http://34.201.129.115:8080/')], contextPath: '/pipeline', onFailure: false, war: '**/*.war' 
        }
            }
        }
    }
}
