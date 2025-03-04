def chart
def applications = ["logstash", "filebeat"]

node {
  stage('Checkout') {
    checkout scm
  }

  stage('Build test image') {
    sh "make build-test-image"
  }

  stage('Test') {
    applications.each { application ->
      dir(application) {
	stage("Test: ${application}") {
	  sh "make test"
	}
      }
    }
  }

  if (env.BRANCH_NAME == 'main') {
    timeout(time: 1, unit: 'HOURS') {
      stage('Release') {
        input 'Release new version?'
      }

      applications.each { application ->
	dir(application) {

	  chart = readYaml file: 'Chart.yaml'

	  stage("Chartmuseum release: ${application}") {
            withCredentials([[$class: 'StringBinding', credentialsId: 'HELM_USER', variable: 'user']]) {
              withCredentials([[$class: 'StringBinding', credentialsId: 'HELM_PASSWORD', variable: 'password']]) {
		sh "HELM_REPO_USERNAME=\"${env.user}\" HELM_REPO_PASSWORD=\"${env.password}\" helm cm-push ./ chartmuseum"
              }
            }
	  }
	}

	stage("Git release: ${application}") {
          println chart.version
          sh 'echo "Creating a new release in github"'
          sh "github-release-wrapper ${chart.version}"
	}
      }
    }
  }
}
