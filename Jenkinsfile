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
                    url: "${REPO_URL}",
                    credentialsId: 'github-creds'
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
                python manage.py test || true
                '''
            }
        }

        stage('Push to GitHub') {
            steps {
                sh '''
                git status
                git add .
                git commit -m "Auto deploy via Jenkins" || true
                git push origin main
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Code pushed → Render auto deployment started"
        }
        failure {
            echo "❌ Jenkins pipeline failed"
        }
    }
}
