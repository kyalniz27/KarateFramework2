Feature: Create new entry in the server

  Background: 
    Given url 'http://localhost:9897'
    Then print '#######################################################################################################'

  Scenario: Get the data from app in JSON and validate using fuzzy matcher
    Given path '/normal/webapi/add'
    And request {"jobId": 2,	"jobTitle": "SDET", "jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'SDET'
    Then print '#######################################################################################################'

  Scenario: Create new entry using external file
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'QA'
    Then print '#######################################################################################################'

  Scenario: Create job entry using embedded expression
    Given path '/normal/webapi/add'
    * def getJobID = function(){return Math.floor(Math.random() * 100)}
    And request {"jobId": '#(getJobID())',	"jobTitle": "Doctor", "jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'Doctor'
    Then print '#######################################################################################################'
