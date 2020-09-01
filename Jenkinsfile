pipeline {
    agent any

    stages {
        stage('build image') {
            steps {
                git branch: "${BRANCH}",
                    credentialsId: '79fc1830-4eff-4d5d-8586-20d85b58755a',
                    url: 'git@github.com:LinGaryTW/docker_delpoy_test.git'
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