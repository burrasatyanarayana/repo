pipeline {
    agent 'linux' // Use any available agent for this pipeline

    environment {
        DOCKER_IMAGE_NAME = "my-app" // Name of the Docker image
        DOCKER_TAG = "latest"        // Tag for the image
        DOCKER_PORT = "8082"         // Port to run the container on
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository (ensure the necessary files are pulled)
                echo 'Checking out the repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    // Build the Docker image using the Dockerfile
                    sh """
                        docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_TAG} .
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container on port 8082...'
                script {
                    // Run the Docker container on port 8082, mapping host port 8082 to container port 8082
                    sh """
                        docker run -d -p ${DOCKER_PORT}:${DOCKER_PORT} --name ${DOCKER_IMAGE_NAME}_container ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}
                    """
                }
            }
        }

        stage('Verify Docker Container') {
            steps {
                echo 'Verifying if Docker container is running...'
                script {
                    // Check if the container is running
                    sh 'docker ps -a'
                }
            }
        }
    }

    post {
        success {
            echo 'Docker container successfully built and running on port 8082. You can access the website at http://<your-jenkins-agent-ip>:8082'
        }
        failure {
            echo 'An error occurred during the build or container startup.'
        }
    }
}
