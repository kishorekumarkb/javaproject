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
               sh ' docker build -t kishore1:latest .' 
                // sh 'docker tag kishore1:v4 ${user}/kishore1:v4 https://registry.hub.docker.com '
               withCredentials([usernamePassword(credentialsId: 'kishorehub', passwordVariable: 'pw', usernameVariable: 'user')]) {
                 // sh 'docker tag kishore1:v4 ${user}/kishore1:v4 '
                   sh "docker tag kishore1:latest registry.hub.docker.com/${user}/kishore1:latest "
                sh 'docker images'
                sh "docker login -u ${user} -p ${pw} https://registry.hub.docker.com"
                   sh "docker push registry.hub.docker.com/${user}/kishore1:latest"
               sh 'docker images'
              }
          }
    }
        stage('deploy'){
            steps{
              withCredentials([file(credentialsId: "kishore_config", variable: 'config')]) {
                  sh """
                  export KUBECONFIG=\${config}
                  helm install myweb ./myweb/ --namespace=kkk
                  """
                  // kubectl create -f hello.yaml -n kkk
              }
            }
        }
}
}
