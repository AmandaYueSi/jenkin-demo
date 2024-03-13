pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'java -version'
        sh 'mvn -version'
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
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}
