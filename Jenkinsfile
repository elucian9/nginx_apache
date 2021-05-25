pipeline {
  agent any
  stages {

    stage('Checkout') {
      steps {
        cleanWs()
        echo 'Cloning project'
        sh 'git clone https://github.com/elucian9/nginx_apache.git'
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
