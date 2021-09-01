class UserResponsesController < ApplicationController
  load_and_authorize_resource CasestudyUser
  load_and_authorize_resource UserResponse, through: CasestudyUser

  def index
    puts user_response_params
  end

  def new
    @casestudy_user, @casestudy, @pages, @questions, @user_responses = TestHandler.new(user_response_params, current_user).load_data
    authorize! :read, @casestudy_user
    if @casestudy_user.status == 'completed' || @casestudy_user.status == 'assessed'
      redirect_to root_path, notice: 'test already submitted.'
    else
      TestHandler.new(user_response_params, current_user).start_test
      @time_elapsed = @casestudy_user.time_elapsed
      @deadline = (DateTime.now + (@casestudy_user.casestudy.duration - @time_elapsed).seconds).to_s
    end
  end

  def create
    if user_response_params.include?(:question)
      TestHandler.new(user_response_params, current_user).update_answer
    else
      TestHandler.new(user_response_params, current_user).mark_completed
      redirect_to root_path, notice: 'Test submitted successfully.'
    end
  end

  def updatetime
    @casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
    duration = @casestudy_user.casestudy.duration
    @casestudy_user.update(time_elapsed: duration - (params[:time_elapsed].to_i / 1000))
  end

  private

  def user_response_params
    params
  end
end
