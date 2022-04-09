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
				sh 'jar -cvf Hw1.war *'
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
                	sh 'docker login -u jagadishramidi -p Qwerty@123'
					myapp.push("${env.BUILD_ID}")
                }
            }
        }        
        stage("UpdateDeployment") {
			steps{
				sh 'kubectl config view'
				sh "kubectl get deployments"
				sh "kubectl set image deployment/swe645deployment swe645hw2=jagadishramidi/swe645:${env.BUILD_ID}"
			}
		}
    }    
}