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
               sh ' docker build -t kishore:v4 .' 
               sh 'docker tag kishore:v4 kishorekumarkb/kishore:v4 '
               withCredentials([usernamePassword(credentialsId: 'kishorehub', passwordVariable: 'pw', usernameVariable: 'user')]) {
                sh 'docker login -u ${user} -p ${pw} --password --stdin'
               sh 'docker push kishorekumarkb/kishore:v4 '
               sh 'docker images'
              }
          }
    }
}
}
