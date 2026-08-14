pipeline {

    agent any

    environment {
        IMAGE_NAME = "riteshprasad07/portfolio"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    credentialsId: 'github',
                    url: 'https://github.com/Ritesh-Prasad/K8s-full-Project.git'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build \
                    -t $IMAGE_NAME:$BUILD_NUMBER .
                '''
            }
        }

        stage('Trivy Scan') {
            steps {
                sh '''
                    /usr/local/bin/trivy \
                    --config /dev/null \
                    image \
                    --severity HIGH,CRITICAL \
                    --exit-code 1 \
                    $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

    }
}