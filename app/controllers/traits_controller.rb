class TraitsController < ApplicationController
  load_and_authorize_resource
  def index; end

  def new; end

  def create
    @trait = Trait.create trait_params
    if @trait.save
      redirect_to traits_path, notice: "\"#{@trait.name}\" trait added."
    else
      render :new
    end
  end

  def destroy
    @trait.destroy
    redirect_to traits_path, notice: "\"#{@trait.name}\" trait deleted."
  end

  private

  def trait_params
    params.require(:trait).permit :name
  end
end
