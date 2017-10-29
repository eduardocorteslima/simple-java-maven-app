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

            steps {
                echo 'comecou'
                sh 'java -version'
            }
        }

    }

}
