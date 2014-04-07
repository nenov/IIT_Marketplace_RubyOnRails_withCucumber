Given /^a user visits the signin page$/ do
	visit signin_path
end

Given /^a user visits the signup page$/ do
  visit "/signup"
end

When /^he submits invalid signin information$/ do
  fill_in "Email",    with: "invalid name"
  fill_in "Password", with: "some invalid password"
  click_button "Sign in"
end

When /^he submits invalid signup information$/ do
  fill_in "Name", with: "Example User"
  fill_in "Email",    with: "invalid name"
  fill_in "Password", with: "some invalid password"
  fill_in "Password Confirmation", with: "some other invalid password confirmation"
  fill_in "Enter confirmation code", with: "some invalid code"
  click_button "Create my account"
end

When /^he submits valid signup information$/ do
  fill_in "Name", with: "Example User"
  fill_in "Email",    with: "user@Example.iit.edu"
  fill_in "Password", with: "foobar"
  fill_in "Password Confirmation", with: "foobar"
  fill_in "Enter confirmation code", with: "#{ :email[0].ord}#{ :email[1].ord}#{ :email[2].ord}#{ :email[3].ord}#{ :email[4].ord}"
  click_button "Create my account"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@Example.iit.edu",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_content("Welcome to the IIT Marketplace!")
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end