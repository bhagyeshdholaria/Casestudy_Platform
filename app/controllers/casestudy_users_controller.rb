class CasestudyUsersController < ApplicationController
  # load_and_authorize_resource :casestudy
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    @casestudy_user = CasestudyUser.create(casestudy_user_params)
    @casestudy_user.errors
    if @casestudy_user.save
      redirect_to casestudy_users_path
    else
      render :new
    end
  end

  private

  def casestudy_user_params
    params.require(:casestudy_user).permit :casestudy_id, :assessor_id, :user_id
  end
end
