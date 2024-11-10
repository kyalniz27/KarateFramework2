Feature: Variables creation in Karate framework

  Background: Create and initialize variables
    * def app_name = 'Google'
    * def page_load_timeout = 20

  Scenario: Creating variables
    Given def var_int = 10
    And def var_string = 'Karate'
    Then print "Int Variable ==> ", var_int
    Then print "String variable ==> ", var_string
    * def var_int2 = var_int + 10
    Then print 'New variable of int ==> ', var_int2
