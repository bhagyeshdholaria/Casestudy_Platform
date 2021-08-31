class TestHandler
  def initialize(params, user)
    @params = params
    @curr_user = user
  end

  def start_test
    @casestudy_user = CasestudyUser.find(@params[:casestudy_user_id])
    if (@casestudy_user.status == 'pending') && @casestudy_user.started_time.nil?
      @casestudy_user.status = 'ongoing'
      @casestudy_user.started_time = DateTime.now
      @casestudy_user.save
      AutocompletionJob.set(wait_until: @casestudy_user.started_time + 1.days).perform_later(@casestudy_user)
    end
  end

  def load_data
    @casestudy_user = CasestudyUser.find(@params[:casestudy_user_id])
    @casestudy = @casestudy_user.casestudy
    @pages = @casestudy.pages
    @questions = @casestudy.questions
    @questions.each do |q|
      UserResponse.find_or_create_by(casestudy_user_id: @casestudy_user.id, question_id: q.id, user_id: @curr_user.id)
    end
    @user_responses = @casestudy_user.user_responses
    [@casestudy_user, @casestudy, @pages, @questions, @user_responses]
  end

  def update_answer
    UserResponse.find_or_initialize_by(casestudy_user_id: @params[:casestudy_user_id],
                                       question_id: @params[:question],
                                       user_id: @curr_user.id)
                .update(response: @params[:user_response][:response])
  end
  
  def mark_completed
    @casestudy_user = CasestudyUser.find(@params[:casestudy_user_id])
    @casestudy_user.status = 'completed'
    @casestudy_user.completed_time = DateTime.now
    @casestudy_user.save
  end
end
