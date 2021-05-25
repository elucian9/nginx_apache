pipeline {
  agent any
  stages {

    stage('Checkout') {
      steps {
        cleanWs()
        echo 'Cloning project'
        sh 'git clone http://192.168.1.39/root/poc_nginx_httpd.git'
        }
    }
    
    stage('Build printenv') {
      steps {
        sh 'printenv'
        }
    }

    stage('Build') {
      steps {
        sh 'cd $WORKSPACE/nginx_apache && sudo vagrant up'
        }    
    }

    stage('Run Tests') {
      steps {
        sh 'sudo $WORKSPACE/nginx_apache/tests/test_infra_poc.sh'
        }  
    }
    
  }
}
