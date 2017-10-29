pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh './jenkins/scripts/deliver.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                  junit 'target/surefire-reports/*.xml'
                }
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
