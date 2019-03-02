pipeline {
    agent any
    stages {
        stage('deploy stack'){
            steps{
                withAWS(region:'us-east-1', profile:'default') {
                    cfnUpdate(stack:'crowley-cloud', file:'crowleycloud.yml')
                }

            }
        }
        stage('Get web source'){
            def outputs = cfnDescribe(stack:'crowley-cloud')
            steps{
                

                dir('repo'){
                    git(
                        url: 'https://github.com/HardHero/crowley-cv',
                        branch: 'master'
                    )
                }
                withAWS(region:'us-east-1', profile:'default') {
                    s3Upload(file:'repo', bucket:'crowley-cloud', path:'')
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