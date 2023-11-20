// pipeline {
//     agent any
//     parameters {
//         credentials credentialType: 'com.cloudbees.jenkins.plugins.awscredentials.AWSCredentialsImpl', defaultValue: '', name: 'AWS', required: false
// }

//     environment {
//         PATH = "${PATH}:${getTerraformPath()}"
//     }
//     stages{

//          stage('Initial Deployment Approval') {
//               steps {
//                 script {
//                 def userInput = input(id: 'confirm', message: 'Start Pipeline?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Start Pipeline', name: 'confirm'] ])
//              }
//            }
//         }

//          stage('terraform init'){
//              steps {
//                  //sh "returnStatus: true, script: 'terraform workspace new dev'"
//                  sh "terraform init"
                 
//          }
//          }
//          stage('terraform plan'){
//              steps {
//                  //sh "returnStatus: true, script: 'terraform workspace new dev'"
//                 //  sh "terraform apply -auto-approve"
//                   sh "terraform plan -out=tfplan -input=false"
//              }
//          }
//         stage('Dev Deployment Approval') {
//               steps {
//                 script {
//                 def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
//              }
//            }
//         }
//          stage('Deploy into Dev'){
//              steps {
//                  //sh "returnStatus: true, script: 'terraform workspace new dev'"
//                     //  sh "terraform apply -auto-approve"
//                      sh "terraform destroy -input=false -auto-approve"
//                 //   sh "terraform apply  -input=false tfplan"
//              }
//          }


//         //   stage('UAT Deployment Approval') {
//         //       steps {
//         //         script {
//         //         def userInput = input(id: 'confirm', message: 'Deploy into UAT?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Deploy Into UAT', name: 'confirm'] ])
//         //      }
//         //    }
//         // }

//         // stage('Deploy into UAT'){
//         //      steps {
//         //          //sh "returnStatus: true, script: 'terraform workspace new dev'"
//         //          //sh "terraform apply -auto-approve"
//         //         //  sh "terraform destroy -input=false -auto-approve"
//         //          sh "terraform apply  -input=false tfplan"
//         //      }
//         //  }
        
//     }
// }

//  def getTerraformPath(){
//         def tfHome= tool name: 'terraform-14', type: 'terraform'
//         return tfHome
//     }

// //  def getAnsiblePath(){
// //         def AnsibleHome= tool name: 'Ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
// //         return AnsibleHome
//     }

// ==========New Code Added 11/19/2023 ====================================

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up or perform any necessary post-build actions
            }
        }
    }
}
