Feature: Get method testing

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Get the data from app
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: Get data from app in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: Get data from app in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
