pipeline {
    agent any

    environment {
	DOCKER_PASS_KEY = credentials('DockerKey')
    }    

    stages {
        stage('Build') {
            steps {
                sh '''
                ./home/ubuntu/jenkins/pipeline/jenkins/build/mvn.sh mvn -B -DskipTests clean package
                ./home/ubuntu/jenkins/pipeline/jenkins/build/build.sh
                '''
            }
            post {
                success {
                    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }
        stage('Test') {
            steps {
                sh ''' 
                ./home/ubuntu/jenkins/pipeline/jenkins/test/mvn.sh mvn test
                '''
            }
            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Push') {
            steps {
                sh '''
                ./home/ubuntu/jenkins/pipeline/jenkins/push/push.sh
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh './home/ubuntu/jenkins/pipeline/jenkins/deploy/deploy.sh' 
            }
        }
    }
}
