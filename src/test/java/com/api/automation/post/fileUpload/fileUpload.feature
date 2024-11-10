Feature: Testing file upload feature

  Background: 
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Upload file to the server
    Given path '/normal/webapi/upload'
    #To upload a file we need: 1.location of the file, 2.name of the file, 3.content-type header value
    #Note: The second file name comes from endpoint key value
    And multipart file file = {read: 'fileToUpload.txt', filename:'fileToUpload.txt', Content-Type:'multipart/form-data'}
    When method post
    Then status 200
    And print response
    And print '====================================================================================='

  Scenario: Upload file to the server using JSON data
    Given path '/normal/webapi/upload'
    * def fileLocation = '../data/jobEntry.json'
    And multipart file file = {read: '#(fileLocation)', filename:'jobEntry.json', Content-Type:'multipart/form-data'}
    When method post
    Then status 200
    And print response
    And match response.message contains 'jobEntry.json'
    And print '====================================================================================='
