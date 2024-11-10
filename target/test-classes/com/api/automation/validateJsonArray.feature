Feature: Validate GET endpoint

  Background: 
    Given url 'http://localhost:9897'

  Scenario: Get the data from app in JSON and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    #validate the size of json array
    And match response.[0].experience == '#[3]'
    #Use wild card character (*) instead of index.
    #1. Assert entire JSON array
    And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    #2. Use contains keyword
    And match response.[0].experience[*] contains ['Apple']

  Scenario: Get the data from app in XML and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == "Google"
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    #Traverse the XML similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'
