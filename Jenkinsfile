pipeline {
    agent any
    stages {
        stage('q'){
            steps{
                sh('aws s3 ls')
            }
        }
        stage('deploy stack'){
            steps{
                sh('aws s3 ls')
                cfnUpdate(
                    stack:'crowleycloud', 
                    file:'crowleycloud.yml'
                )
            }
        }



        stage('update bucket'){
            environment { 
                CC = cfnDescribe(stack: 'crowleycloud')
            }
            steps{
                print CC
            }
        }

        // stage('config server'){
        //     steps{
        //         ansiblePlaybook(
        //             playbook: 'site.yml',
        //             inventory: 'hosts'
        //         )
        //     }
        // }
    }
}