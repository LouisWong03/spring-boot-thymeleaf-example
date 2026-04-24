pipeline {
    agent any

    tools {
        jdk 'JDK8'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                bat 'gradlew.bat build -x test'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'gradlew.bat RunTest'
            }
            post {
                always {
                    junit 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Code Coverage') {
            steps {
                echo 'Generating JaCoCo coverage report...'
                bat 'gradlew.bat jacocoTestReport'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging application...'
                bat 'gradlew.bat bootJar'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t spring-thymeleaf-app .'
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}