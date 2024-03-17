pipeline {
    agent { dockerfile true }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'node --version'
                sh 'svn --version'
            }
        }
    }
}
