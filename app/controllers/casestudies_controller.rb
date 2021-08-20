class CasestudiesController < ApplicationController
  load_and_authorize_resource
  def index; end

  def new
    @casestudy = current_user.createdcasestudies.build
  end

  def show

  end

  def create
    @casestudy = current_user.createdcasestudies.create(casestudy_params)
    if @casestudy.save
      redirect_to @casestudy
    end
  end

  def newpage
    @page = Casestudy.find(params[:casestudy_id]).pages.build
    # puts @page.inspect
  end

  def createpage
    # puts params
    @casestudy = Casestudy.find(params[:casestudy_id])
    @page = @casestudy.pages.create(page_params)
    if @page.save
      # puts "#### #{@page.inspect}"
      redirect_to casestudy_path(@casestudy)
    end
  end


  private

  def casestudy_params
    params.require(:casestudy).permit :name, :duration, :scale
  end

  def page_params
    params.require(:page).permit :body
  end

end
