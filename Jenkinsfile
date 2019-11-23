pipeline {
    agent any
    parameters{
        string(name:'ELASTIC_IP', defaultValue: '', description: 'An AWS Elastic IP')
        string(name:'DOMAIN', defaultValue: 'crowley.cloud')
        string(name:'STACK_NAME', defaultValue: 'crowley-cloud')
    }
    stages {
        stage('deploy stack'){
            steps{
                withAWS(region:'us-east-1', profile:'default') {
                    cfnUpdate(
                        stack:"${STACK_NAME}", 
                        file:'crowleycloud.yml', 
                        params:["ElasticIP=${ELASTIC_IP}"],
                    )
                }

            }
        }
        stage('config server'){
            
            steps{
                sleep(60)
                ansiblePlaybook(
                    inventory: 'hosts.ini',
                    playbook: 'site.yml',
                    extraVars: [
                        DOMAIN: "${DOMAIN}",
                        ELASTIC_IP: [value: "${ELASTIC_IP}", hidden: true]
                ])
            }
        }
    }
}