pipeline{
    agent any  
    /* agent{label 'AgentName'} OR agent null*/
    triggers {
        // cron '* * * * *'
        pollSCM '* * * * *'
        // githubPush()
    }

    tools{
        maven 'maven_3.9.0'
        git 'Default'
    }

    stages{
        stage('git'){
            steps{
              git branch: 'feature/test', credentialsId: 'JavaWebApp_github_id', url: 'https://github.com/Rambo4Fuggi/MASC_JAVA-WEB-APP.git'  
            }
        }
        stage('maven'){
            steps{
                sh "mvn clean package"
            }
        }
        stage('Tomcat'){
            steps{
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat', path: '', url: 'http://host.docker.internal:8080/')], contextPath: 'MyApp', war: '**/JavaWebApp.war'
            }
        }
    }

    post{
        always{
            emailext body: ''' ''', subject: '', to: ' , '
        }
        // success{}
        // failure{}
    }

    options {
      buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
      timestamps
    }
}
