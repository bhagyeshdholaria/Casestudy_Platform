class DashboardController < ApplicationController
  # before_action :authenticate_user!
  authorize_resource class: false

  def index
    redirect_to after_sign_in_path_for(current_user) if current_user
  end

  def candidatedash; end

  def assessordash; end

  def contentcreatordash; end

end
