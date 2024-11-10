Feature: Validate GET endpoint from external file

  Background: Create and initialize base url
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Create new entry using external file for schema validation
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    And match response ==
      """
      {
      "jobId": '#number',
      "jobTitle": '#string',
      "jobDescription": '#string',
      "experience": '#[] #string',
      "project": '#[] #object'
      }
      """
