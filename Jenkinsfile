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
                    cfnUpdate(stack:'crowley-cloud', file:'crowleycloud.yml')
                }

            }
        }

        stage('config server'){
            steps{
                ansiblePlaybook(
                    playbook: 'site.yml',
                    inventory: 'hosts'
                )
            }
        }
    }
}