Given /^a user said he will be available on tuesday from (\d+) to (\d+)$/ do |arg1, arg2|
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
  @user.save!
  @interval = Interval.new(day: "Tuesday", start_hour: arg1, start_minute: 0,
  				end_hour: arg2, end_minute: 0)
  @interval.user_id = @user.id
  @interval.save!
end

When /^he goes to his profile page$/ do
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When /^he clicks the available delivery time link$/ do
  click_link "Available Delivery Times"
end

Then /^he is taken to a page saying he is available tuesday from 15 to 17$/ do
  page.should have_content "You are available on:"
  page.should have_content "Tuesday from 15:0 to 17:0"
end

Given /^a user visits the intervals creation page$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
  @user.save!
  visit new_interval_path
end

When /^he creates the intervals by the interface$/ do
  select "Monday", from: "Day"
  select "13", from: "Start hour"
  select "30", from: "Start minute"
  select "15", from: "End hour"
  select "30", from: "End minute"
end

When /^he clicks submit$/ do
  click_button "Submit !"
end

Then /^the interval has been created in the database$/ do
  Interval.where("day = ? AND start_hour = ? AND start_minute = ? AND end_hour = ? AND end_minute = ?",
                "Monday", 13, 30, 15, 30).count.should == 1
end


When /^he creates an interval where the end is before the start$/ do
  select "Monday", from: "Day"
  select "15", from: "Start hour"
  select "30", from: "Start minute"
  select "13", from: "End hour"
  select "30", from: "End minute"
end

Then /^the interval should be created in the right order$/ do
  Interval.where("day = ? AND start_hour = ? AND start_minute = ? AND end_hour = ? AND end_minute = ?",
                "Monday", 13, 30, 15, 30).count.should == 1
end


Given /^he visits the intervals index page$/ do
  visit intervals_path
end

When /^he clicks edit$/ do
  click_link "Edit"
end

When /^he modifies the interval$/ do
  select "Tuesday", from: "Day"
  select "12", from: "Start hour"
  select "45", from: "Start minute"
  select "18", from: "End hour"
  select "55", from: "End minute"
end

Then /^the interval should be modified in the database$/ do
    Interval.where("day = ? AND start_hour = ? AND start_minute = ? AND end_hour = ? AND end_minute = ?",
                "Tuesday", 12, 45, 18, 55).count.should == 1
end

