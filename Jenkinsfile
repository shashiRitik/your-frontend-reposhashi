pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "your-frontend-app"
        CONTAINER_NAME = "frontend-container"
        APP_PORT = "3000"
        DOCKER_PORT = "80"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/shashiRitik/your-frontend-reposhashi.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "Building Docker Image..."
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                echo "Stopping and removing old container if exists..."
                docker rm -f $CONTAINER_NAME || true

                echo "Running new container..."
                docker run -d --name $CONTAINER_NAME -p $APP_PORT:$DOCKER_PORT $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
