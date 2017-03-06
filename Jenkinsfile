#!groovy
// define name of project
projectBaseName = 'node-java'

node {
  stage('checkout') {
    checkout scm: [
      $class: 'GitSCM',
      userRemoteConfigs: [[credentialsId: 'erentodevsSSH', url: 'git@github.com:erento/infra-node-java.git']],
    ],
      changelog: false,
      poll: false
  }

  def tagVersion= sh(script:"git tag -l --sort=-creatordate | head -n 1", returnStdout: true).trim()

  stage('checkout tag') {
      checkout scm: [
      $class: 'GitSCM',
      userRemoteConfigs: [[credentialsId: 'erentodevsSSH', url: 'git@github.com:erento/infra-node-java.git']],
      branches: [[name: "refs/tags/${tagVersion}"]]],
      changelog: false,
      poll: false
  }

  def myImage
  stage('build image') {
    myImage = docker.build("erento/${projectBaseName}:${tagVersion}")
  }

  stage('publish tagged image') {
    myImage.push("${tagVersion}")
  }

  stage('publish latest image') {
    myImage.push()
  }
}
1
