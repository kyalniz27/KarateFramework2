Feature: Testing update endpoints of the application

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Update job entry for an existing job in the server using JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',	"jobTitle": "SDET", "jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
         {
      "jobId": '#(id)',
      "jobTitle": "SDET",
      "jobDescription": "To test android application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      },
       {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
      ]
      }

      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+id+")].project")
    And match projectArray[0] == '#[2]'

  Scenario: Update job entry for an existing job in the server calling another feature file
    #To call another feature file follow the below
    Given call read("../MethodForCreateJobEntry.feature")
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
         {
      "jobId": '125',
      "jobTitle": "SDET",
      "jobDescription": "To test android application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      },
       {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
      ]
      }

      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And match projectArray[0] == '#[2]'
    
     Scenario: Update job entry for an existing job in the server and access the variable from calling feature file
    #To call another feature file follow the below
    #Given call read("../MethodForCreateJobEntry.feature")
    #Note: You can call the helper method and assign to a variable to reach its content
    * def postRequest = call read("../MethodForCreateJobEntry.feature")
    And print "Calling another faeture file ==>", postRequest.id
     And print "Calling another faeture file ==>", postRequest.getRandomValue()
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
         {
      "jobId": '#(postRequest.id)',
      "jobTitle": "SDET",
      "jobDescription": "To test android application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      },
       {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
      ]
      }

      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ postRequest.id+")].project")
    And match projectArray[0] == '#[2]'
    
       Scenario: Update job entry for an existing job in the server and access the variable from calling feature file with variables
    #To call another feature file follow the below
    #Given call read("../MethodForCreateJobEntry.feature")
    #Note: You can call the helper method and assign to a variable to reach its content
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(id)'}
       # PUT request
    Given path '/normal/webapi/update'
    And request
      """
         {
      "jobId": '#(id)',
      "jobTitle": "SDET",
      "jobDescription": "To test android application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      },
       {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
      ]
      }

      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id+")].project")
    And match projectArray[0] == '#[2]'
    
    
