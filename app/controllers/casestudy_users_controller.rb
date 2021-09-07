class CasestudyUsersController < ApplicationController
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

  def update
    assessor_responses = ar_params[:assessor_response]
    if AssessorResponse.update(assessor_responses.keys, assessor_responses.values)
      @casestudy_user.status = 'assessed'
      @casestudy_user.save
      redirect_to casestudy_users_path
    end
  end

  private

  def casestudy_user_params
    params.require(:casestudy_user).permit :casestudy_id, :assessor_id, :user_id
  end

  def ar_params
    params.require(:casestudy_user).permit(assessor_response: [:rating])
  end
end
