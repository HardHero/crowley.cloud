pipeline {
    agent any
    stages {
        stage('deploy stack'){
            steps{
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