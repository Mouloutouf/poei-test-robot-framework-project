pipeline{
  agent any

  environment{
    CREDENTIALS_ID = 'AF9B668299D347BD94A5B483625695DE'
    CREDENTIALS_SECRET = '122844954716c4634d2a0fa63817998fb045981813fb2dc7f3a002d087a55b97'
    PROJECT_KEY = 'POEI20252'
  }
  stages{
    stage('Authentication'){
      steps{
        script{
          bat """
            curl -X POST https://xray.cloud.getxray.app/api/v2/authenticate ^
            -H "Content-Type: application/json" ^
            -d "{\\"client_id\\": \\"%CREDENTIALS_ID%\\", \\"client_secret\\": \\"%CREDENTIALS_SECRET%\\"}" ^
            > token.txt
          """
        }
      }
    }
    stage('Test'){
      steps{
        bat 'pabot tests'
      }
    }
    stage('Export'){
      steps{
        script{
          bat """
            set /p TOKEN=<token.txt
            curl -X POST https://xray.cloud.getxray.app/api/v2/import/execution/robot?projectKey=%PROJECT_KEY% ^
            -H "Content-Type: test/xml" ^
            -H "Authorization: Bearer %TOKEN%" ^
            --data "@output.xml"
          """
        }
      }
    }
  }
}
