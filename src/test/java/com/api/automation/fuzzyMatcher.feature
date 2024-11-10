Feature: Validate GET endpoint

  Background: 
    Given url 'http://localhost:9897'

  Scenario: Get the data from app in JSON and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    #Fuzzy matcher
    And match response.[0].jobId == '#present'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].jobTitle == '#string'
    And match response.[0].jobId == '#number'
    #validate the size of json array
    And match response.[0].experience == '#[3]'
    #Use wild card character (*) instead of index.
    #1. Assert entire JSON array
    And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    #2. Use contains keyword
    And match response.[0].experience[*] contains ['Apple']
    # Complex fuzzy matcher 1
    And match response.[0].jobId == '#? _ == 1'
    And match response.[0].jobTitle == '#string? _.length >= 1'
    And match response.[0].jobTitle.id == '#notpresent'
    # Complex fuzzy matcher 2. Validate array
    And match response.[0].experience == '#[]'
    And match response.[0].experience == '#[3]'
    And match response.[0].experience == '#[3] #string'
    # Combine complex fuzzy matcher
    And match response.[0].experience == '#[3] #string? _.length >= 2'
