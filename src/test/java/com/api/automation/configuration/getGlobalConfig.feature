Feature: To get global variables

  Background: 
    * def localmyVarName = myVarName
    Given print 'My local variable name', localmyVarName

  Scenario: Get the global variables from environment
    * def localUsername = username
    Given print 'My username from local environment', localUsername
    And print "My password accessing it directly", password
