Feature: Validate GET endpoint from external file

  Background: Create and initialize base url
    Given url 'http://localhost:9897'
    And print '====================================================================================='

  Scenario: Create and execute JS functions
  	* def getIntValue = function(yob){return 2024 - yob}
  	Then print "Your age is", getIntValue(1985)
  	* def getRandomValue = function(){return Math.floor(Math.random() * 100)}
  	Then print "The random value is", getRandomValue()
  	And print '====================================================================================='
  