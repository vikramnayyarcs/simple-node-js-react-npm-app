pipeline {
    agent any
    stages {
        stage('Build and Run') {
            steps {
                bat '''
                    :: Install dependencies
                    npm install

                    :: Run build
                    npm run build

                    :: Start the application in the background
                    start /B npm start

                    :: Wait for the application to be ready
                    echo Waiting for the application to be ready...
                    :loop
                    curl --silent http://localhost:3000 >nul 2>&1
                    if errorlevel 1 (
                        timeout /t 1 >nul
                        goto loop
                    )

                    :: Notify
                    echo Visit http://localhost:3000 to see your Node.js/React application in action.
                '''
            }
        }
    }
}
