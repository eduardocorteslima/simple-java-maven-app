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
            agent {
                docker {
                    image 'jre8:01'
                    args  '-v /apps:/home -e APP=/home/my-app-1.0-SNAPSHOT.jar'
                }
            }
            steps {
                echo 'comecou'
                sh 'java -version'
            }
        }
    }
}
