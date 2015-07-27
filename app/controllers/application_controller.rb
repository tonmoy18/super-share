class ApplicationController < ActionController::Base
  include SignInHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def require_login
    unless logged_in?
      redirect_to auth_login_path
    end

  end

end
