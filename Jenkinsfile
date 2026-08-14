pipeline {

    agent any

    environment {
        IMAGE_NAME = "riteshprasad07/portfolio"
        DOCKER_IMAGE = "riteshprasad07/myportfolio"
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
                    --scanners vuln \
                    --ignorefile /dev/null \
                    --severity HIGH,CRITICAL \
                    --exit-code 1 \
                    $IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

        stage('Tag & Push Docker Image') {
            steps {
                withDockerRegistry(
                    credentialsId: 'dockerhub',
                    url: 'https://index.docker.io/v1/'
                ) {
                    sh '''
                        docker tag \
                        $IMAGE_NAME:$BUILD_NUMBER \
                        $DOCKER_IMAGE:v$BUILD_NUMBER

                        docker push \
                        $DOCKER_IMAGE:v$BUILD_NUMBER
                    '''
                }
            }
        }
    }
}