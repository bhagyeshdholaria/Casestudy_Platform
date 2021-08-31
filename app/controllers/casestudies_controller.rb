class CasestudiesController < ApplicationController
  load_and_authorize_resource
  def index; end

  def show; end

  def new
    @casestudy = current_user.createdcasestudies.build
  end

  def create
    @casestudy = current_user.createdcasestudies.create(casestudy_params)
    if @casestudy.save
      redirect_to @casestudy, notice: 'Casestudy created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @casestudy.update(casestudy_params)
      redirect_to @casestudy, notice: 'Casestudy details updated successfully.'
    end
  end

  private

  def casestudy_params
    params.require(:casestudy).permit :name, :duration, :scale, :passkey
  end
end
