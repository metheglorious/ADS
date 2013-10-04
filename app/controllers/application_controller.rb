class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end