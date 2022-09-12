  pipeline {
    agent Built-In Node 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub-creds')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/rajatroy021/Demo_Project.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t rajatroy/my_website:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push rajatroy/my_website:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
