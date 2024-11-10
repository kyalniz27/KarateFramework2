Feature: Accessing endpoints with Basic Auth

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Get endpoint with basic auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'

  Scenario: Get endpoint without basic auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'user:test1234'}
    When method get
    Then status 401
    And print response

  Scenario: Get endpoint with basic auth and using js function for auth
    Given path '/secure/webapi/all'
    * def auth = call read('../../basicAuth.js') {username:'admin',password:'welcome'}
    And print 'This is the Encoded string for auth ==>', auth
    And headers {Accept:'application/json', Authorization:'#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'
