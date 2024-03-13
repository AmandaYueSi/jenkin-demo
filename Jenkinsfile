pipeline {
  agent none
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          agent {
            node {
              label 'java17'
            }

          }
          steps {
            sh './jenkins/build.sh'
            stash(name: 'Java 17', includes: 'target/**')
          }
        }

        stage('Build 11') {
          agent {
            node {
              label 'java11'
            }

          }
          steps {
            sh './jenkins/build.sh'
            stash(name: 'Java 11', includes: 'target/**')
          }
        }

      }
    }

    stage('Testing') {
      parallel {
        stage('Testing') {
          agent {
            node {
              label 'java17'
            }

          }
          steps {
            unstash 'Java 17'
            sh './jenkins/test-all.sh'
          }
        }

        stage('Test 11') {
          steps {
            unstash 'Java 11'
            sh './jenkins/test-all.sh'
          }
        }

      }
    }

    stage('Confirm Deploy to Staging') {
      steps {
        input(ok: 'Yes', message: 'Deploy to Stage')
        echo 'Confirmation'
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}