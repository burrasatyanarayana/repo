pipeline {
    agent { label 'linux' } // Ensure your Linux agent is labeled 'linux'
    
    stages {
        stage('Update System') {
            steps {
                echo 'Updating system packages...'
                sh '''
                    sudo apt-get update -y
                '''
            }
        }
        stage('Install Docker Dependencies') {
            steps {
                echo 'Installing Docker dependencies...'
                sh '''
                    sudo apt-get install -y \
                        apt-transport-https \
                        ca-certificates \
                        curl \
                        software-properties-common
                '''
            }
        }
        stage('Add Docker GPG Key') {
            steps {
                echo 'Adding Docker GPG key...'
                sh '''
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
                '''
            }
        }
        stage('Set up Docker Repository') {
            steps {
                echo 'Setting up Docker repository...'
                sh '''
                    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                '''
            }
        }
        stage('Install Docker') {
            steps {
                echo 'Installing Docker...'
                sh '''
                    sudo apt-get update -y
                    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
                '''
            }
        }
        stage('Verify Docker Installation') {
            steps {
                echo 'Verifying Docker installation...'
                sh '''
                    docker --version
                '''
            }
        }
        stage('Add Jenkins User to Docker Group') {
            steps {
                echo 'Adding Jenkins user to the Docker group...'
                sh '''
                    sudo usermod -aG docker $USER
                '''
            }
        }
    }
    post {
        success {
            echo 'Docker has been installed successfully!'
        }
        failure {
            echo 'An error occurred during the pipeline execution.'
        }
    }
}
