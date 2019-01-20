pipeline {
    agent any
    stages {
        stage('deploy stack'){
            steps{
                git(
                    url: '/Users/cheez/personal-projects/crowley.cloud'
                )

                def outputs = cfnUpdate(
                    stack:'crowleycloud', 
                    file:'crowleycloud.yml'
                )

            }
        }
    }
}