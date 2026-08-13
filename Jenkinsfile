pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Ritesh-Prasad/K8s-full-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio .'
            }
        }

        stage('Tag & Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker tag portfolio riteshprasad07/myportfolio:v1'
                    sh 'docker push riteshprasad07/myportfolio:v1'
                }
            }
        }

    }
}
