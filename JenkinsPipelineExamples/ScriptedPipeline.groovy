//Scripted pipeline
node('your-node') {
    stage('Build') { //Build stage
        // Referring jenkins environment variable BRANCH_NAME
        if (env.BRANCH_NAME == 'master') {
            echo 'Execute on the master branch'
        } else {
            echo 'I execute elsewhere'
        }
    }
    stage('Test') { // Test stage
            try {
                sh 'exit 1'
            }
            catch (exc) {
                echo 'Something failed!'
                throw
            }
        }
    stage("Deploy") { // Deploy stage
        node("linux") {  // Running this stage on node with label "linux"
            echo "One"
        }
    }
}