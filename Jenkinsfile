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
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            sh './jenkins/scripts/test.sh --passWithNoTests'
                        }
                    } else {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            bat 'jenkins\\scripts\\test.bat --passWithNoTests'
                        }
                    }
                }
            }
        }
    }
}
