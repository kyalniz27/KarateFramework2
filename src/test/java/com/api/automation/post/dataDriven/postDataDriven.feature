Feature: DDT
  I want to use this template for my feature file

  #Background: DDT testing
  #* def testdata = read("DDT.csv")

  #Accessing variable name in the scenario title only exists in Karate
  Scenario Outline: Create multiple job entries for data driven testing <path>
    Given print '<url>'
    When print '<path>'
    And print '<method>'
    Then print '<status>'

    Examples: 
      | url                   | path               | method | status |
      | http://localhost:9897 | /normal/webapi/all | get    |    200 |
      | http://localhost:9897 | /normal/webapi/add | post   |    201 |

  Scenario Outline: Data driven for the job description entry
    Given url 'http://localhost:9897'
    Given path '/normal/webapi/add'
    And request {"jobId": '#(jobId)',	"jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status <status>

    Examples: 
      | jobId | jobTitle | jobDescription  | status |
      |  9897 | PO       | To do something |    201 |
      | id    | BA       | To do something |    400 |
      | false | QA       | To do something |    400 |

  Scenario Outline: Data driven testing using an external csv file - <jobTitle>
    Given url 'http://localhost:9897'
    Given path '/normal/webapi/add'
    And request {"jobId": '#(jobId)',	"jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status <status>

    Examples: 
      | read("DDT.csv") |
