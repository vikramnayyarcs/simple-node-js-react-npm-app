pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                bat 'npm install'
            }
        }
        stage('Test') { 
            steps {
                script {
                    // Check the OS and run the appropriate script
                    if (isUnix()) {
                        sh './jenkins/scripts/test.sh'
                    } else {
                        bat 'jenkins\\scripts\\test.bat'
                    }
                }
            }
        }
    }
}
