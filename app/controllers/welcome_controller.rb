class WelcomeController < ApplicationController
  def index
    redirect_to auth_login_path
  end
end
