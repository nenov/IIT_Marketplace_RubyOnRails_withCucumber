Feature: Sellers should be able to tell when they are available.

Scenario: Showing intervals
	Given a user said he will be available on tuesday from 15 to 17
	When he goes to his profile page
	And he clicks the available delivery time link
	Then he is taken to a page saying he is available tuesday from 15 to 17

Scenario: Creating intervals
	Given a user visits the intervals creation page
	When he creates the intervals by the interface 
	And he clicks submit
	Then the interval has been created in the database

Scenario: Invalid interval
	Given a user visits the intervals creation page
	When he creates an interval where the end is before the start
	And he clicks submit
	Then the interval should be created in the right order

Scenario: Modify interval
	Given a user said he will be available on tuesday from 15 to 17
    And he visits the intervals index page
    When he clicks edit
    And he modifies the interval
    And he clicks submit
    Then the interval should be modified in the database