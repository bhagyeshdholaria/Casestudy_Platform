class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]
  before_action :get_casestudy

  def new
    @page = @casestudy.pages.build
  end

  def create
    @page = @casestudy.pages.create(page_params)
    if @page.save
      redirect_to casestudy_path(@casestudy), notice: 'Page saved successfully.'
    else
      render :new
    end

  end

  def edit; end

  def update
    if @page.update(page_params)
      redirect_to casestudy_path(@casestudy), notice: 'Page updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to casestudy_path(@casestudy), alert: 'Page deleted successfully.'
  end

  private

  def set_page
    @page = Page.find params[:id]
  end

  def get_casestudy
    @casestudy = Casestudy.find params[:casestudy_id]
  end

  def page_params
    params.require(:page).permit :body
  end
end
