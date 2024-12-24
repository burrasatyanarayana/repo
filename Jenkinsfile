pipeline {
    agent any

    environment {
        // Docker image and container details
        DOCKER_IMAGE = "web-app-example:latest" // Change "web-app-example" to your desired name
        CONTAINER_NAME = "web-app-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Print repository details
                echo 'Cloning repository from SCM...'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using Dockerfile in the repo
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Remove Existing Container') {
            steps {
                // Stop and remove any existing container with the same name
                sh '''
                docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME || true
                docker ps -a -q --filter "name=$CONTAINER_NAME" | grep -q . && docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the container and expose it on port 8000
                sh 'docker run -d --name $CONTAINER_NAME -p 8000:80 $DOCKER_IMAGE'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed. Check the application on port 8000.'
        }
    }
}
