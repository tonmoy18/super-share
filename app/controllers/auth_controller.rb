class AuthController < ApplicationController
  include SignInHelper

  skip_before_action :require_login, only: [:login, :create, :failed]
  skip_before_action :require_set_current_user, only: [:login, :create, :failed]

  def login
    if logged_in?
      redirect_to logins_path
    end
  end


  def create
    login_with(params[:login])
  end

  def logout
  end

  private
  def login_params
    params.require(:login).permit(:username, :password)
  end

end
