pipeline {
    agent any 
    stages {
        stage('Checkout') {
            steps {
                echo'Checkout'
                #sh '''
                    #if [-d devops]
                    #git clone https://github.com/sharathcre/devops.git
                #'''
            }
        }
        stage('Unit Testing') {
            #agent { docker 'maven'}
            steps {
                echo'Unit Testing'
                #sh '''
                    #cd devops
                    #mvn test
                #'''
            }
        }
        stage('Sonar Analysis') {
            #agent { docker 'openjdk:8-jre' } 
            steps {
                echo'Sonar Analysis'
                #sh 'mvn sonar:sonar'
            }
        }
        stage('Build Artifact') {
            #agent {docker 'maven'}
            steps {
                echo'Build Artifact'
                #sh 'mvn package'
            }
        }
        stage('Publish Artifact to Nexus') {
            #agent {docker 'Nexus'}
            steps {
                echo'Publish Artifact to Nexus'
                #sh 'mvn deploy'
            }
        }
        stage('Deploy Artifact on Tomcat') {
            steps {
                echo'Deploying'
            }
        }
    }
}
