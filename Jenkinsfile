pipeline {
	agent any
	stages {
		stage("Building the Student Survey Image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf Hw1.war -C WebContent/ .'
					sh 'echo ${BUILD TIMESTAMP}'
					sh "docker login -u jagadishramidi -p Keesara?593649"
					def customImage = docker.build("jagadishramidi/swe645:$(BUILD_TIMESTAMP}")
				}
			}
		}
		stage("Pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push jagadishramidi/swe645:$(BUILD TIMESTAMP)'
				}
			}
		}
		stage("Deploying to Rancher as single pod") {
			steps {
				script{
					sh "kubectl set image deployment/swe645hw2 swe645hw2=jagadishramidi/swe645:$(BUILD_TIMESTAMP} -n jenkins-pipeline"
				}
			}
		}
		stage("Deploying to Rancher as with load balancer") {
			steps {
				sh 'kubectl set image deployment/swehw2 swehw2=jagadishramidi/swe645:$(BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}
	}
}