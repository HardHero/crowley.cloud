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
            steps{
                bucket_name=cfnDescribe(
                    stack: 'crowleycloud'
                )
                print bucket_name
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