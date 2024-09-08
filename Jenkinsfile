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
                            sh './jenkins/scripts/test.sh'
                        }
                    } else {
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                            bat 'jenkins\\scripts\\test.bat'
                        }
                    }
                }
            }
        }
        stage('Deliver') {
            steps {
                script {
                    // Run the delivery script
                    bat 'jenkins\\scripts\\deliver.bat'

                    // Wait for user input
                    input message: 'Finished using the web site? (Click "Proceed" to continue)'

                    // Run the kill script
                    bat 'jenkins\\scripts\\kill.bat'
                }
            }
        }

    }
}
