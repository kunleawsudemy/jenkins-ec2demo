# terraform-jenkins

# terraform-jenkins

## ----------- User Data for EC2 Instance ----------------------------
#!/bin/bash

sudo yum update -y

sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

sudo systemctl status amazon-ssm-agent

sudo systemctl start amazon-ssm-agent

##-- Install Jenkins
##-- Reference: https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo yum install git -y

---------------------------------
pipeline {
    agent any
    tools {
        terraform 'terraform-11'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'main', credentialsId: 'github_credential', url: 'https://github.com/kunleadex/terraform-jenkins'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}

Install Terraform: https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip

