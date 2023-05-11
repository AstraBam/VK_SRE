pipeline {
    agent any

        stage('Deploy') {
            steps {
                sh 'ansible-playbook playbook.yml -i host.txt' 
            }
        }
    }
