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
            }
        }
        stage('Build Artifact') {
            steps {
                echo'Build Artifact'
                sh'mvn package'
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
            }
        }
    }
}
