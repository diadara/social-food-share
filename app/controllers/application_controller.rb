class ApplicationController < ActionController::Base
  #protect_from_forgery

  protected
  # Authentication helper methods will start from here
  def current_user
    @current_user ||= User.where(:id => cookies[:user_id]).first if cookies[:user_id]
  end

  def authenticate_user
    unless current_user
      session[:login_redirect] = request.fullpath
      redirect_to sessions_url
    else
      session[:login_redirect] = nil
    end
  end

  helper_method :current_user

end
