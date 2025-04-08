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
    stage('Webhook'){
      steps{
        script {
          def testResults = readFile('output.xml')
          def totalTests = testResults.count('<test id=')
          def passedTests = testResults.count('status="PASS"')
          def failedTests = totalTests - passedTests

          def tagPattern = /<tag>(.*?)<\/tag>/
          def tags = []
          testResults.eachMatch(tagPattern) { match ->
              tags << match[1]
          }
          def uniqueTags = tags.unique().join(', ')

          def discordPayload = """
          {
          "username": "Louise",
          "embeds": [{
            "title": "Test Results",
            "color": 3066993,
            "fields": [
            {
              "name": "Total Tests",
              "value": "${totalTests}",
              "inline": true
            },
            {
              "name": "Passed",
              "value": "${passedTests}",
              "inline": true
            },
            {
              "name": "Failed",
              "value": "${failedTests}",
              "inline": true
            },
            {
              "name": "Tags",
              "value": "${uniqueTags}",
              "inline": false
            }
            ]
          },
          {
            "title": "Test Report"
            "url": "attachment://report.html"
          }]
          }
          """

        writeFile file: 'discordPayload.json', text: discordPayload
        bat 'curl -H "Content-Type: application/json" -X POST --data @discordPayload.json https://discordapp.com/api/webhooks/1359154405147934992/2RwoZD57gNSStkB8yxAUT4O7jAe7OOAECZTCuMj9tDW6RBHYUaCjgon1E05MoTjsaQlg'
        }
      }
    }
    stage('Results'){
      steps{
        robot(outputPath: ".",
          passThreshold: 90.0,
          unstableThreshold: 70.0,
          disableArchiveOutput: true,
          outputFileName: "output.xml",
          logFileName: 'log.html',
          reportFileName: 'report.html',
          countSkippedTests: true,
          otherFiles: 'selenium-screenshot-*.png'
        )
      }
    }
  }
}
