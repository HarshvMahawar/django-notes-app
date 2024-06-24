pipeline {
    agent any

    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/LondheShubham153/django-notes-app", branch: "main"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build('my-django-app:latest', '-f Dockerfile .')
                }
            }
        }

        stage("Test") {
            agent {
                docker {
                    image "my-django-app:latest"
                }
            }
            steps {
                script {
                    // Check if we are able to run scripts inside docker container, various unit and integration test can follow
                    sh "python3 --version"
                    sh "cd /app/backend"
                    
                }
            }
        }
    }

    post {
        success {
            script {
                // Remove the Docker image on successful build
                sh 'docker rmi my-django-app:latest'
            }
        }
    }
}

