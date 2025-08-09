pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "your-frontend-app"
        CONTAINER_NAME = "frontend-container"
        DOCKER_PORT = "80"
        APP_PORT = "80"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/shashiRitik/your-frontend-reposhashi.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh '''
                        if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
                            docker stop $CONTAINER_NAME
                            docker rm $CONTAINER_NAME
                        fi
                    '''
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh 'docker run -d --name $CONTAINER_NAME -p $APP_PORT:$DOCKER_PORT $DOCKER_IMAGE'
                }
            }
        }
    }
}
