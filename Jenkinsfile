pipeline {
    agent any

    stages {
        stage('gitCheckout') {
            steps {
                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kishorekumarkb/javaproject.git']]])
                sh 'ls'
            }
            
        }
    }
    stage('readpomfile') {
        readMavenPom file: 'pom.xml'
        sh 'cat pom.xml'
   }
}


