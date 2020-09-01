pipeline {
    agent any

    stages {
        stage('build image') {
            steps {
                sh "docker build -f ci.dockerfile -t gary_test_ci ."
            }
        }
        stage('run test'){
            steps{
                sh "docker run --rm gary_test"
            }
        }
        stage('merge into master'){
            steps{
                sh "git fetch origin master \
                    && git checkout master \
                    && git merge origin/${BRANCH} \
                    && git push origin master"
            }
        }
    }
}