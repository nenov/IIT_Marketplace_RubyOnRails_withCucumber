When /^he fills in the old password field$/ do
	fill_in "Current password", with: "foobar"
end

When /^he clicks the edit profile link$/ do
	click_link "Edit profile"
end

When /^he fills in the new password field$/ do
	fill_in "New password", with: "newfoobar"
end

When /^he fills in the new password confirmation field$/ do
	fill_in "New password confirmation", with: "newfoobar"
end

When /^he clicks change password$/ do
	@user= User.where("name = ?", "Example User").first
	click_button "Change password"
end

Then /^his password is modified$/ do
	assert User.where("name = ?", "Example User").first.authenticate "newfoobar"
end
