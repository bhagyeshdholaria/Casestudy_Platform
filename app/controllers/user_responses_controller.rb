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

  private

  def user_response_params
    params
  end
end
