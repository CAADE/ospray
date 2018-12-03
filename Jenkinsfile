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
                dir('arch') {
                    script {
                        docker.build registry + ":arch";
                    }
                }
              }
            }
            stage('centos6') {
              steps {
                dir('centos6') {
                    script {
                        docker.build(registry + ":centos6");
                    }
                }
              }
            }
            stage('centos7') {
              steps {
                dir('centos7') {
                  sh 'pwd'
                    script {
                        docker.build(registry + ":centos7");
                    }
                }
              }
            }
            stage('docu') {
              steps {
                dir('docu') {
                  sh 'pwd'
                  script {
                      docker.build(registry + ":docu");
                  }
                }
              }
            }
            stage('ubuntu14.04') {
              steps {
                dir('ubuntu14.04') {
                  sh 'pwd'
                  script {
                      docker.build(registry + ":ubuntu14.04");
                  }
                }
              }
            }
            stage('ubuntu16.04') {
              steps {
                dir('ubuntu16.04') {
                  sh 'pwd'
                  script {
                      docker.build(registry + ":ubuntu16.04");
                  }
                }
              }
            }
            stage('ubuntu17.04') {
              steps {
                dir('ubuntu17.04') {
                  sh 'pwd'
                  script {
                      docker.build(registry + ":ubuntu17.04");
                  }
                }
              }
            }
            stage('ubuntu') {
              steps {
                dir('ubuntu') {
                  sh 'pwd'
                  script {
                      docker.build(registry + ":ubuntu");
                  }
                }
              }
            }
        }
     }
  }
}
