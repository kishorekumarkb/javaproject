pipeline {
agent any
    stages {
        stage('gitCheckout') {
            steps {
                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kishorekumarkb/javaproject.git']]])
                sh 'ls'
            }
        }
       stage('mvn Build') {
             steps {
               sh 'echo "mvn build..."'
               sh ' mvn clean install'
              }
          }
        stage('Docker build') {
             steps {
               sh 'echo "docker build..."'
               sh ' docker build -t kishore:${env.BUILD_ID}'
               sh 'docker images'
              }
          }
    }
}

