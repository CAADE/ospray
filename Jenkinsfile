pipeline {
  environment {
    stagingRegistry = "madajaju/ospray"
    stagingRegistryCredential = "dockerhub"
    registry = "madajaju/ospray"
    registryCredential = "dockerhub"
  }
  agent any
  stages {
  stage ('Build Images') {
        parallel {
            stage('arch') {
              steps {
                script {
                    docker.build(registry + ":arch", "-f arch/Dockerfile");
                }
              }
            }
            stage('centos6') {
              steps {
                script {
                    docker.build(registry + ":centos6", "-f centos6/Dockerfile");
                }
              }
            }
            stage('centos7') {
              steps {
                script {
                    docker.build(registry + ":centos7", "-f centos7/Dockerfile");
                }
              }
            }
            stage('docu') {
              steps {
                script {
                    docker.build(registry + ":docu", "-f docu/Dockerfile");
                }
              }
            }
            stage('ubuntu14.04') {
              steps {
                script {
                    docker.build(registry + ":ubuntu14.04", "-f ubuntu14.04/Dockerfile");
                }
              }
            }
            stage('ubuntu16.04') {
              steps {
                script {
                    docker.build(registry + ":ubuntu16.04", "-f ubuntu16.04/Dockerfile");
                }
              }
            }
            stage('ubuntu17.04') {
              steps {
                script {
                    docker.build(registry + ":ubuntu17.04", "-f unbuntu17.04/Dockerfile");
                }
              }
            }
        }
    }
  }
}
