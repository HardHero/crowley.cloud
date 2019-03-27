pipeline {
    agent any
    parameters{
        string(name:'ELASTIC_IP', defaultValue: '', description: 'An AWS Elastic IP')
        string(name:'DOMAIN', defaultValue: 'crowley.cloud')
    }
    stages {
        stage('deploy stack'){
            steps{
                withAWS(region:'us-east-1', profile:'default') {
                    cfnUpdate(
                        stack:'crowley-cloud', 
                        file:'crowleycloud.yml', 
                        params:["ElasticIP=${ELASTIC_IP}"],
                    )
                }

            }
        }
        stage('config server'){
            steps{
                dir('repo'){
                    git(
                        url: 'https://github.com/HardHero/crowley-cv',
                        branch: 'master'
                    )
                }
                dir('www'){
                    sh 'cp -r repo/{*.css,*.html} ./'
                }
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