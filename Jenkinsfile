pipeline {
    agent any
    tools {
        maven 'maven-3.9'
    }
    stages{
        stage('source code'){
            steps{
                git branch: 'main',
                    url: 'https://github.com/Indreshwar/spring-petclinic-jan-2026.git'
            }
        }
        stage('Check Maven'){
            steps {
                sh 'mvn -version'
            }
        }
        stage('build the code'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Archiving the artifacts'){
            steps{
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }
    }
}
