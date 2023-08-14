pipeline {
    agent any
    environment {
      DOCKER_IMAGE_TAG = getDockerImageTag()
    }
    stages {
        stage('Docker build') {
            steps {
                sh "docker build . -t artemiyshuppa/docker-jenkins-ansible:${DOCKER_IMAGE_TAG}"
            }
        }
        stage('Docker push') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub', url: '') {
                    sh "docker push artemiyshuppa/docker-jenkins-ansible:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}

def getDockerImageTag() {
    def commitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD '
    return commitHash
}

