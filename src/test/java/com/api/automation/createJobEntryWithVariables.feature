Feature: To create job entry in the test application with variables

  Scenario: To create job entry with JSON data
    Given url _url
    Given path _path
    And print "Helper ==>", _url
    And print "Helper ==>", _path
    And print "Helper ==>", _id
    #* def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    #* def id = getRandomValue()
    And request {"jobId": '#(_id)',	"jobTitle": "SDET", "jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    * def responseJobId = response.jobId
     * def responseJobTitle = response.jobTitle
