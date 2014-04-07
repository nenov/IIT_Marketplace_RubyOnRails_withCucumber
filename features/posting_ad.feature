Feature: Posting an ad

Scenario: Signed in user posts an ad
	Given some user logs in
	And he goes to the ad list page
	And he click the New ad link
	And he fills the form for the ad
	And he clicks continue
	Then he is taken to the intervals selector
