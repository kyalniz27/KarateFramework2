Feature: To create job entry in the test application
  Helper file for POST /normal/webapi/add

  Scenario: To create job entry with JSON data
   	Given url 'http://localhost:9897'
    Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',	"jobTitle": "SDET", "jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    * def responseJobId = response.jobId
