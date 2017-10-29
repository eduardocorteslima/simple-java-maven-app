pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }

            steps {
                sh 'mvn -B -DskipTests clean package'
                sh './jenkins/scripts/deliver.sh'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn test'
            }
        }
        stage('Deliver') {
            agent any
            steps {
                sh 'docker ps -a'
            }
        }
    }
}
