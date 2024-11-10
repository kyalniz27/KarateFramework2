Feature: Validate GET endpoint from external file

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Get the data from an external file and validate response
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def actualResponse = read("../jsonResponse.json")
    And match response == actualResponse
    And print "File ==> ", actualResponse