Feature: Delete job entry in the server

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Delete job entry and verify
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    #Send delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    #Get request
    Given path '/normal/webapi/find'
    And params {id: '#(createJobId)', jobTitle: 'SDET'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 404

  Scenario: Delete job entry twice and verify
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    #Send delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    #Send delete request again
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 404

  Scenario: Request chaining create get update delete entry
    #Create job entry
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    #Patch request
    * def jobDes = "To develop android and web applications"
    Given path '/normal/webapi/update/details'
    And params {id: '#(jobId)', jobTitle: '#(jobTitle)', jobDescription: '#(jobDes)'}
    And headers {Accept: 'application/json'}
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    #Get request
    Given path '/normal/webapi/find'
    And params {id: '#(jobId)', jobTitle: '#(jobTitle)'}
    And headers {Accept: 'application/json'}
    And method get
    And match response.jobDescription == jobDes
    #Send delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
