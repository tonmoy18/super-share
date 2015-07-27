module SignInHelper

  def logged_in?
    return session[:current_user_id]
  end


  def login_with(params)

    @login = Login.find_by_username(params[:username])

    if @login.password == params[:password]
      set_token
    end

    redirect_to logins_path
  end


  def logout
    unset_token
  end


  private

  def set_token
    session[:current_user_id] = @login.id
  end

  def unset_token
    session[:current_user_id] = nil
  end


end
