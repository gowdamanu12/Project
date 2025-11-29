pipeline {
    agent any

    environment {
        IMAGE_NAME = "manugowda1998/product-catalog" 
        DOCKERFILE_PATH = "./"    
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
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
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
