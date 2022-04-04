pipeline {
	agent any
	environment {
		DOCKERHUB PASS = credentials(' docker-pass')
	}
	stages {
		stage(Building the Student Survey Image") {
			steps {
				script {
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C WebContent/ .'
					sh 'echo ${BUILD TIMESTAMP}"
					sh "docker login -u hekme5 -p $(DOCKERHUB PASS]"
					def customImage = docker.build("hekme5/studentsurvey645 : $(BUILD_TIMESTAMP}")
				}
			}
		}
		stage("Pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push hekme5/studentsurvey645:$(BUILD TIMESTAMP)'
				}
			}
		}
		stage("Deploying to Rancher as single pod") {
			steps {
				script{
					sh "kubectl set image deployment/stusurvey-pipeline stusurvey-pipeline=hekme5/ studentsurvey645:$(BUILD_TIMESTAMP} -n jenkins-pipeline"
				}
			}
		}
		stage("Deploying to Rancher as with load balancer") {
			steps {
				sh "kubectl set image deployment/studentsurvey645-1b studentsurvey645-lb=hekme5/ studentsurvey645:$(BUILD_TIMESTAMP} -n jenkins-pipeline'
			}
		}
	}
}