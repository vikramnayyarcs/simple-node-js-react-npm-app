node {
    stage('Build and Run') {
        sh '''
            #!/usr/bin/env bash

            # Run build
            npm run build

            # Start the application in the background
            npm start &
            APP_PID=$!

            # Wait for the application to be ready
            echo "Waiting for the application to be ready..."
            while ! curl --silent http://localhost:3000 > /dev/null; do
              sleep 1
            done

            # Save the PID
            echo $APP_PID > .pidfile

            echo 'Now...'
            echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
        '''
    }
}
