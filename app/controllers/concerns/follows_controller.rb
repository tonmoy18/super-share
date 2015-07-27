class FollowsController < ApplicationController
  before_action :set_followee, only: [:create, :destroy]

  def create

    @follow = Follow.create(follower_id: @current_user.id, login_id: @inverse_follower.id)

    @follow.save
    redirect_to logins_path
    
    # if @follow.save
    #   redirect_to login_path(@inverse_follower), notice: "Follwoing #{@inverse_follower.username}"
    # else
    #   redirect_to logins_path
    # end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followee
      @inverse_follower = Login.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def login_params
    #   params.require(:login).permit(:first_name, :last_name, :username, :password, :login_type)
    # end


end
