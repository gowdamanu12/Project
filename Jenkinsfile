pipeline {
    agent any

    environment {
        IMAGE_NAME = "manugowda1998"   // CHANGE THIS
        DOCKERFILE_PATH = "."                          // OR set microservice path
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/gowdamanu12/Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    echo 'Building Docker Image'
                    docker build -t ${IMAGE_NAME}:latest ${DOCKERFILE_PATH}
                """
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub_creds',
                        usernameVariable: 'manugowda1998',
                        passwordVariable: 'Bnmanu@98'
                    )
                ]) {
                    sh """
                        echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin
                    """
                }
            }
        }

        stage('Push Image') {
            steps {
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
    }
}
