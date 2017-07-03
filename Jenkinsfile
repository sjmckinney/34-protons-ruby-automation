pipeline {
  agent any
  stages {
    stage('Tests') {
      steps {
        sh 'bundle exec cucumber'
      }
    }
  }
  environment {
    CI = 'True'
  }
}