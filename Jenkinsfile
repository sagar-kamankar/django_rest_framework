pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/sagar-kamankar/django_rest_framework.git'
        BRANCH = 'main'
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: "${BRANCH}",
                    url: "${REPO_URL}"
            }
        }

        stage('Setup Virtual Env') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                . venv/bin/activate
                python manage.py test
                '''
            }
        }
    }

    post {
        success {
            echo "✅ CI passed. Render will auto-deploy from GitHub."
        }
        failure {
            echo "❌ CI failed. Fix errors before merge."
        }
    }
}
