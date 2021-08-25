class QuestionsController < ApplicationController
  load_and_authorize_resource :casestudy
  load_and_authorize_resource through: :casestudy

  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :get_casestudy
  def new
    @question = @casestudy.questions.build
  end

  def create
    @question = @casestudy.questions.create question_params
    if @question.save
      if params[:trait_ids].present?
        @question.trait_ids = trait_ids
      end
      redirect_to casestudy_path @casestudy, notice: 'Question saved successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      if params[:trait_ids].present?
        @question.trait_ids = trait_ids
      else
        @question.traits.destroy_all
      end
      redirect_to casestudy_path(@casestudy), notice: 'question updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to casestudy_path(@casestudy), notice: 'question deleted successfully.'
  end

  private

  def set_question
    @question = Question.find params[:id]
  end

  def get_casestudy
    @casestudy = Casestudy.find params[:casestudy_id]
  end

  def question_params
    params.require(:question).permit :body
  end

  def trait_ids
    params.require :trait_ids
  end
end
