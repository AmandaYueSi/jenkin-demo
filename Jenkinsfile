pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        node {
          label 'java17'
        }

      }
      steps {
        sh './jenkins/build.sh'
        stash(name: 'Buzz java 17', includes: 'target/**')
        stash(name: 'Java 17', includes: 'target/**')
      }
    }

    stage('Testing') {
      agent {
        node {
          label 'java17'
        }

      }
      steps {
        unstash 'Buzz java 17'
        sh './jenkins/test-all.sh'
        unstash 'Java 17'
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