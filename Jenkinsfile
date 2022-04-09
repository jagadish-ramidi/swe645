pipeline {
    agent any
    environment {
        PROJECT_ID = 'swe645hw2'
        CLUSTER_NAME = 'swe645hw2'
        LOCATION = 'us-east-1a'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage('BuildWAR') {
            steps {
				echo 'Creating the Jar ...'
				sh 'java -version'
				sh 'jar -cvf hw1.war *'
            }
        }
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("jagadishramidi/swe645:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
					docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
					myapp.push("latest")
					myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }        
        stage("UpdateDeployment") {
			steps{
				sh 'kubectl config view'
				sh "kubectl get deployments"
				sh "kubectl set image deployment/survey-app swe645hw2=hy950921/swe645hw2:${env.BUILD_ID}"
			}
		}
    }    
}