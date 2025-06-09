pipeline {
  agent any
  stages {
    stage('Destroy Infrastructure') {
      steps {
        sh 'terraform init'
        sh 'terraform destroy -auto-approve'
      }
    }
  }
}
