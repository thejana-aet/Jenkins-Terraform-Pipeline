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
    AWS_DEFAULT_REGION = "ap-south-1"
  }

  stages {

    stage('Checkout') {
      steps {
        git branch: 'main',
            url: 'https://github.com/your-org/terraform-demo.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Apply') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        input message: 'Create infrastructure?'
        sh 'terraform apply -auto-approve'
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
}
