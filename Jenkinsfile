pipeline {
    agent any
    stages{
        stage('Deploy') {
            steps {
                sh 'ansible-playbook playbook.yml -i host.txt' 
            }
        }
    }
}
