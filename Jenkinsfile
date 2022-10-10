pipeline {
    agent any
    tools{
        terraform 'terraform-11'
    }
    environment{
        GITHUB_TOKEN=credentials('GitHub_token')
        AWS_ACCESS_KEY_ID=credentials('Accecs_key_ID')
        AWS_SECRET_ACCESS_KEY=credentials('Seceret_accsess_key')
        AWS_REGION="us-east-2"
    } 
    

    
    
    
    stages{  
      stage('clean workspace') {
            steps {
                cleanWs()
            }
      }
        
        
      stage('git pull') {
            steps {
                sh '''
                    mkdir terraform_state
                    cd terraform_state
                    git init
                    git pull https://github.com/NorelFarjun/testing.git main
                    
                '''
            }
        }
        
        stage('terraform init and plan') {
            steps {
                sh '''
                    cd terraform_state
                    terraform init -no-color
                    terraform plan -no-color
                '''
            }
        }
        
        
        
        
        
        
        
        
        
        
        
  }
    
    
    
    
    
    
    
    
    
}
/*
    agent any
    tools{
        terraform 'terraform-11'
    }
    environment{
        GITHUB_TOKEN=credentials('github_token')
        AWS_ACCESS_KEY_ID=credentials('Accecs_key_ID')
        AWS_SECRET_ACCESS_KEY=credentials('Seceret_accsess_key')
        AWS_REGION="us-east-2"
    }

    stages {
        
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage('git pull') {
            steps {
                sh '''
                    mkdir terraform_state
                    cd terraform_state
                    git init
                    git pull https://github.com/NorelFarjun/testing.git main
                    
                '''
            }
        }
        
        stage('terraform init and plan') {
            steps {
                sh '''
                    cd terraform_state
                    terraform init -no-color
                    terraform plan -no-color
                '''
            }
        }
        stage('test') {
            steps {
                sh "echo test scrips"
            }
        }
        
        stage('terraform apply') {
            steps {
                sh 'echo terraform apply'
            }
        stage('push new terraform state to repo') {
            steps {
                sh '''
                    cd terraform_state
                    git add *
                    git commit -m new "state: $(date +"%H:%M:%S---%m_%d_%Y")"
                    git push -f --set-upstream https://${GITHUB_TOKEN}@github.com/NorelFarjun/testing.git main
                '''
            }
        }
            
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
    }
}*/
