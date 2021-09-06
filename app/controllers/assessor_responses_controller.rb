class AssessorResponsesController < ApplicationController
  load_and_authorize_resource
  def new
    @casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
    @casestudy = @casestudy_user.casestudy
    @pages = CasestudyUser.find(params[:casestudy_user_id]).casestudy.pages
    @questions = CasestudyUser.find(params[:casestudy_user_id]).casestudy.questions
    @user_responses = CasestudyUser.find(params[:casestudy_user_id]).user_responses
    @casestudy_user.casestudy.questions.each do |question|
      question.question_traits.each do |question_trait|
        @casestudy_user.assessor_responses.find_or_create_by(user: @casestudy_user.user,
                                                             assessor: @casestudy_user.assessor,
                                                             question_trait: question_trait) do |u|
          u.rating = 0
        end
      end
    end
  end

  def index
    @casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
    @casestudy = @casestudy_user.casestudy
    @pages = CasestudyUser.find(params[:casestudy_user_id]).casestudy.pages
    @questions = CasestudyUser.find(params[:casestudy_user_id]).casestudy.questions
    @user_responses = CasestudyUser.find(params[:casestudy_user_id]).user_responses
    @assessor_responses = @casestudy_user.assessor_responses
  end
end
