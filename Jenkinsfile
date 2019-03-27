pipeline {
    agent any
    parameters{
        string(name:'ELASTIC_IP', default: '', description: 'An AWS Elastic IP')
        string(name:'DOMAIN', default: 'crowley.cloud')
    }
    stages {
        stage('deploy stack'){
            steps{
                withAWS(region:'us-east-1', profile:'default') {
                    cfnUpdate(
                        stack:'crowley-cloud', 
                        file:'crowleycloud.yml' 
                        params:["ElasticIP=${ELASTIC_IP}"],
                    )
                }

            }
        }
        stage('config server'){
            steps{
                dir('www'){
                    git(
                        url: 'https://github.com/HardHero/crowley-cv',
                        branch: 'master'
                    )
                }
                ansiblePlaybook(
                    playbook: 'site.yml',
                    inventory: 'hosts'
                    extraVars {
                        extraVar("DOMAIN", "${DOMAIN}", false)
                        extraVar("ELASTIC_IP", "${ELASTIC_IP}", true)
                    }
                )
            }
        }
    }
}