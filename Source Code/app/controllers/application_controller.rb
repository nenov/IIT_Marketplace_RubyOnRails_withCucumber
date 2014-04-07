class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include AdvertsHelper

  def home
  end

end
