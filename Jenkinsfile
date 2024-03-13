pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        node {
          label 'java11'
        }

      }
      steps {
        sh './jenkins/build.sh'
        stash(name: 'Buzz java 17', includes: 'target/**')
      }
    }

    stage('Testing') {
      agent any
      steps {
        unstash 'Buzz java 17'
        sh './jenkins/test-all.sh'
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