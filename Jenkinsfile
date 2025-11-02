pipeline {
    agent any
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }
    stages {
        stage('Requirements') {
            steps {
                // this step is required to make sure the script
                // can be executed directly in a shell
                // bat 'chmod +x ./algorithm.sh'
                echo 'Skipping chmod on Windows'

            }
        }
        stage('Build') {
            steps {
                // the algorithm script creates a file named report.txt
               bat 'wsl echo "scale=1000; 4*a(1)" | bc -l > report.txt'


                // this step archives the report
                archiveArtifacts allowEmptyArchive: true,
                    artifacts: '*.txt',
                    fingerprint: true,
                    onlyIfSuccessful: true
            }
        }
    }
}
