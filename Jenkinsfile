pipeline {
agent any
    stages {
        stage('gitCheckout') {
            steps {
                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kishorekumarkb/javaproject.git']]])
                sh 'ls'
            }
        }
       /* stage('mvn Build') {
             steps {
               sh 'echo "mvn build..."'
               sh ' mvn clean install'
              }
          }*/
        stage('Docker build') {
             steps {
               sh 'echo "docker build..."'
               sh ' docker build -t kishore1:v4 .' 
               sh 'docker tag kishore1:v4 kishorekumarkb/kishore1:v4 '
               withCredentials([usernamePassword(credentialsId: 'kishorenexus', passwordVariable: 'pw', usernameVariable: 'user')]) {
                sh 'docker images'
                sh "docker login -u ${user} -p ${pw} https://nexus.idea.xpaas.io"
                   sh "docker push ${user}/kishore1:v4"
               sh 'docker images'
              }
          }
    }
}
}
