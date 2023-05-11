pipeline {
    agent any
    stages{
        stage('Deploy') {
            environment {
                BITBUCKET_COMMON_CREDS = credentials('8838d40f-65a8-4891-a266-82dd9799f383')
            }
            steps {
                sh 'ansible-playbook playbook.yml -i host.txt' 
            }
        }
    }
}
