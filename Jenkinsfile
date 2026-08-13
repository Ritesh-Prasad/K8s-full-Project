pipeline {
    agent any

    stages {
        stage('build image'){
            steps{
                sh 'docker build -t portfolio .'
            }
        }
        stage('Tag & Push'){
            steps{
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker tag portfolio riteshprasad07/myportfolio:v3'
                    sh 'docker push riteshprasad07/myportfolio:v3'
                }
            }
        }
    }
}
