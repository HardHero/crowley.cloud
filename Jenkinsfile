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
                withAWS(region:'us-east-1', profile:'default') {
                    cfnUpdate(
                        stack:'crowleycloud', 
                        file:'crowleycloud.yml',
                        capabilities : ['CAPABILITY_NAMED_IAM']
                    )
                }

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