Given /^some user logs in$/ do
	@user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
	visit signin_path
	fill_in "Email",    with: @user.email
  	fill_in "Password", with: @user.password 
  	click_button "Sign in"
end

Given /^he goes to the ad list page$/ do
	visit "/adverts"
end

Given /^he click the New ad link$/ do
	click_link "New ad"
end

Given /^he fills the form for the ad$/ do
	fill_in "Title",    with: "Bike"
	fill_in "Description",    with: "I'm selling my bike. It's really fast."
	fill_in "Price (USD)",    with: "50"
end

Given /^he clicks continue$/ do
	click_button "Continue"
end

Then /^he is taken to the intervals selector$/ do
	current_path.should == "/intervals/new"
end
