Feature: Updating partial information using path request

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Update job description for an existing job entry
    * def getRandomValue = function(){return Math.floor(Math.random() * 100)}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
    #Send the patch request
    * def jobDesc = 'To develop mobile and web application'
    Given path '/normal/webapi/update/details'
    And params {id: '#(createJobId)', jobTitle: 'SDET', jobDescription: '#(jobDesc)'}
    And headers {Accept: 'application/json'}
    When method patch
    Then status 200
    And match response.jobDescription == jobDesc