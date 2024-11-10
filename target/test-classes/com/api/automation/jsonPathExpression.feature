Feature: Use json path expression

  Background: Set up the base URL
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Get the data from app using jsonPath expression
    Given path '/normal/webapi/all'
    When method get
    Then status 200
    # karate.jsonPath(doc, jsPathExpr)
    * def jobID = 1
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == "+jobID+")].jobTitle")
    * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
    * def experience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
    And print "Job Title ==>", jobTitle
    And print "Job Description ==>", jobDescription
    And print "Experience ==> ", experience
    And print '====================================================================================='
