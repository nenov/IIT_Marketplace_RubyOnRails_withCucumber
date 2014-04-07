Feature: All users should be able to browse ads

Scenario: An anonymous browses the ads
	Given there is an ad for a book online
	And an anonymous user arrives on the site
	And he clicks the "Enter the marketplace" link
	Then he should see a list containing the title "Book"
	Given he clicks on the "Book" link
	Then he should see the ad for a book