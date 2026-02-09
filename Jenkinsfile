pipeline {
  agent any

  parameters {
    choice(
      name: 'ACTION',
      choices: ['apply', 'destroy'],
      description: 'Terraform action'
    )
  }

  environment {
    AWS_DEFAULT_REGION = "us-east-1"
    //AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    //AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }

  stages {

    stage('Checkout') {
      steps {
        git branch: 'main',
            url: 'https://github.com/thejana-aet/Jenkins-Terraform-Pipeline.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        input message: 'Create infrastructure?'
        sh 'terraform apply -auto-approve tfplan'
      }
    }

    stage('Terraform Destroy') {
      when {
        expression { params.ACTION == 'destroy' }
      }
      steps {
        input message: 'Destroy infrastructure?'
        sh 'terraform destroy -auto-approve'
      }
    }
  }

  post {
    always {
      // Clean up plan file
      sh 'rm -f tfplan'
    }
  }
}