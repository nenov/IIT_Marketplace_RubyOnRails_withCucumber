Given /^an anonymous user visits the ads page$/ do
	visit "/adverts"
end

Given /^there is an ad for a book online$/ do
	@user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
	@ad = Advert.create(title: "Book", description: "I'm selling a book.",
						reverse: false, price: 20, user_id: @user.id)
end

Given /^an anonymous user arrives on the site$/ do
	visit root_path
end

Given /^he clicks the "Enter the marketplace" link$/ do
	click_link "Enter the Marketplace"
end

Then /^he should see a list containing the title "Book"$/ do
	page.should have_selector('ul li', text: "Book")
end

Given /^he clicks on the "Book" link$/ do
	click_link "Book"
end

Then /^he should see the ad for a book$/ do
  page.should have_content("Book")
  page.should have_content("I'm selling a book.")
  page.should have_content("20")
end
