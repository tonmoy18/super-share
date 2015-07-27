class FollowsController < ApplicationController
  before_action :set_followee, only: [:create, :destroy]

  def create
    @followee
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followee
      @followee = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.require(:login).permit(:first_name, :last_name, :username, :password, :login_type)
    end


end
