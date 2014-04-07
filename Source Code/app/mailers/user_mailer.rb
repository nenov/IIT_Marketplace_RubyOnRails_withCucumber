class UserMailer < ActionMailer::Base
  default :from => "iitmarketplace@iitmarketplace.mailgun.org"
  
def welcome_email(user)
    @user = user
    @url  = "https://iitmarketplace.herokuapp.com/signin"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end