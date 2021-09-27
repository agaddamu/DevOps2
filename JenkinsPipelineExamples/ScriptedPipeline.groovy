node {
    stage('Build') {
        if (env.BRANCH_NAME == 'master') {
            echo 'Execute on the master branch'
        } else {
            echo 'I execute elsewhere'
        }
    }
    stage('Test') {
            try {
                sh 'exit 1'
            }
            catch (exc) {
                echo 'Something failed!'
                throw
            }
        }
    stage("Deploy") {
        node("linux") {
            echo "One"
        }
    }
}