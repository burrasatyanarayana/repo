node('linux') { // Runs on a Linux agent
    try {
        stage('Update System') {
            echo 'Updating system packages...'
            sh '''
            sudo apt-get update -y
            '''
        }
        
        stage('Install Docker Dependencies') {
            echo 'Installing Docker dependencies...'
            sh '''
            sudo apt-get install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                software-properties-common
            '''
        }
        
        stage('Add Docker GPG Key') {
            echo 'Adding Docker GPG key...'
            sh '''
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
            '''
        }
        
        stage('Set up Docker Repository') {
            echo 'Setting up Docker repository...'
            sh '''
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            '''
        }
        
        stage('Install Docker') {
            echo 'Installing Docker...'
            sh '''
            sudo apt-get update -y
            sudo apt-get install -y docker-ce docker-ce-cli containerd.io
            '''
        }
        
        stage('Verify Docker Installation') {
            echo 'Verifying Docker installation...'
            sh '''
            docker --version
            '''
        }
        
        stage('Add Jenkins User to Docker Group') {
            echo 'Adding Jenkins user to the Docker group...'
            sh '''
            sudo usermod -aG docker $USER
            '''
        }
        
        echo 'Docker has been installed successfully!'
    } catch (Exception e) {
        echo "An error occurred: ${e.getMessage()}"
        currentBuild.result = 'FAILURE'
    }
}
