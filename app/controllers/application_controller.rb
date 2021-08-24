class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.roles.exists?(name: 'contentcreator')
      contentcreator_dashboard_path
    elsif resource.roles.exists?(name: 'assessor')
      assessor_dashboard_path
    elsif resource.roles.exists?(name: 'candidate')
      candidate_dashboard_path
    else
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      # format.json { head :forbidden }
      format.html { redirect_to root_path, alert: 'Invalid URL' }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
