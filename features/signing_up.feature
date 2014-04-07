Feature: Signing up

Scenario: Unsuccessful sign up
	Given a user visits the signup page
	When he submits invalid signup information
	Then he should see an error message

Scenario: Successful sign up
	Given a user visits the signup page
	When he submits valid signup information
	Then he should see his profile page
	And he should see a signout link