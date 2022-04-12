pipeline {
    agent any 
    stages {
         stage('Checkout') {
            steps {
                echo'Cloning Repository'
               sh '''if [-d devops]
                     then
                        cd devops
                        git pull
                     else
                        git clone https://github.com/sharathcre/devops.git
                     fi
                  '''
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
            }
        }
        stage('Build Artifact') {
            steps {
                echo'Build Artifact'
            }
        }
        stage('Publish Artifact to Nexus') {
            steps {
                echo'Publish Artifact to Nexus'
            }
        }
        stage('Deploy Artifact on Tomcat') {
            steps {
                echo'Deploying'
            }
        }
    }
}
