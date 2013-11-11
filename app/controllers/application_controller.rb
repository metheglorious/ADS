class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :notice => exception.message
  end
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end