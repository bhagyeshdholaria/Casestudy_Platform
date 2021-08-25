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
    if QuestionTrait.exists?(trait_id: @trait.id)
      redirect_to traits_path, alert: 'Trait is assigned to existing casestudies.'
    else
      @trait.destroy
      redirect_to traits_path, notice: "\"#{@trait.name}\" trait deleted."
    end
  end

  private

  def trait_params
    params.require(:trait).permit :name
  end
end
