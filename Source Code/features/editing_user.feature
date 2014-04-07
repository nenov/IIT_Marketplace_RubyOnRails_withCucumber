Feature: Editting user's information

Scenario: User changes his password
	Given some user logs in
	And he clicks the edit profile link
	When he fills in the old password field
	And he fills in the new password field
	And he fills in the new password confirmation field
	And he clicks change password
	Then his password is modified