
pipeline {
    agent any

    stages {
        stage('gitCheckout') {
            steps {
                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kishorekumarkb/javaproject.git']]])
                sh 'ls'
            }
        }
    stages {
        stage('readpomfile') {
            steps {
                readMavenPom file: 'pom.xml'
                 
            }
        }
    }
}
