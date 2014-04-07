class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if(params[:q]!="#{ :email[0].ord}#{ :email[1].ord}#{ :email[2].ord}#{ :email[3].ord}#{ :email[4].ord}")
      flash[:error]="Wrong confirmation code"
      render 'new'
    else
        if(params[:user][:email][/iit.edu/])
          if @user.save
            
            sign_in @user
            flash[:success] = "Welcome to IIT Marketplace"
            redirect_to @user
          else
            render 'new'
          end
        else
          flash[:error]="Not a iit.edu e-mail"
          render 'new'
        end
  
  end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def change_password
    @user = User.find(params[:id])
    if @user.authenticate(params[:current_password]) && params[:new_password]==params[:new_password_confirmation]
      @user.password= params[:new_password]
      @user.password_confirmation= params[:new_password_confirmation]
      @user.save
      flash[:success]="Password changed"
      redirect_to user_path
    else
      flash[:error]="Passwords don't match"
      redirect_to edit_user_path
    end
  end

  def send_simple_message
    RestClient.post "https://api:key-90u-14v55im4kblo8ystnkcat9irhre4"\
    "@api.mailgun.net/v2/iitmarketplace.mailgun.org/messages",
    :from => "iitmarketplace@iitmarketplace.mailgun.org",
    :to => params[:email],
    :subject => "Confirmation Code",
    :text => "Welcome to the IIT Marketplace!\nYou confirmation code is: #{ :email[0].ord}#{ :email[1].ord}#{ :email[2].ord}#{ :email[3].ord}#{ :email[4].ord}"

  end
  def send_password
    RestClient.post "https://api:key-90u-14v55im4kblo8ystnkcat9irhre4"\
    "@api.mailgun.net/v2/iitmarketplace.mailgun.org/messages",
    :from => "iitmarketplace@iitmarketplace.mailgun.org",
    :to => params[:email],
    :subject => "Forgotten Password",
    :text => "Your new password is: #{new_password}"

  end
  def new_password
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(8) { |i| newpass << chars[rand(chars.size-1)] }
    @user=User.where("email = ?", params[:email]).first
    @user.password = newpass
    @user.password_confirmation = newpass
    @user.save
    return newpass
    
  end

end