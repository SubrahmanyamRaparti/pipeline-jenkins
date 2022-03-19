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
        }
        stage('Test') {
            steps {
                sh ''' 
                ./home/ubuntu/jenkins/pipeline/jenkins/test/mvn.sh mvn test
                '''
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
