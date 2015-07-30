class LoginsController < ApplicationController
  before_action :set_login, only: [:show, :edit, :update, :follow]
  before_action :check_admin, only: [:new, :create]
  before_action :check_self, only: [:edit, :update]
  # GET /logins
  # GET /logins.json
  def index
    @logins = Login.all
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # GET /logins/1/edit
  def edit
  end

  # POST /logins
  # POST /logins.json
  def create
    @login = Login.new(new_login_params)

    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render action: 'show', status: :created, location: @login }
      else
        format.html { render action: 'new' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    respond_to do |format|
      if @login.update(edit_login_params)
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow
    @follow = Follow.create(follower_id: @current_user.id, author_id: @login.id)
    respond_to do |format|
      format.html { redirect_to logins_url }
      format.json { head :no_content }
    end
  end

  # # DELETE /logins/1
  # # DELETE /logins/1.json
  # def destroy
  #   @login.destroy
  #   respond_to do |format|
  #     format.html { redirect_to logins_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_login_params
      params.require(:login).permit(:first_name, :last_name, :username, :password, :login_type)
    end

    def edit_login_params
      params.require(:login).permit(:first_name, :last_name)
    end

    def check_admin
      if LOGIN_TYPES[@current_user.login_type] != 'Admin'
        redirect_to logins_path
      end
    end

    def check_self
      if @login != @current_user
        redirect_to logins_path
      end
    end

end
