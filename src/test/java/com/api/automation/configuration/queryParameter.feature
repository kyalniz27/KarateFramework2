
Feature: Testing query endpoints of the application

  Background: 
    Given url _url
    And print '====================================================================================='

  Scenario: Test the application using query parameter
    #Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    #Send the get request with query param
    Given path '/normal/webapi/find'
    #And param id = createJobId
    #And param jobTitle = 'SDET'
    #Note: Combine multiple parameters
    And params {id: '#(createJobId)', jobTitle: 'SDET'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId
    
    Scenario: Test the application using query parameter with negative scenario
    #Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    #Send the get request with query param
    Given path '/normal/webapi/find'
    And param id = 0102
    And param jobTitle = 'SDET'
    #Note: Combine multiple parameters
    #And params {id: '#(createJobId)', jobTitle: 'SDET'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 404