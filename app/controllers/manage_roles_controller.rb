class ManageRolesController < ApplicationController
  load_and_authorize_resource RoleUser

  def index
    @role_user = RoleUser.new
    @users = User.all
  end

  def create
    @role_user = RoleUser.create(role_user_params)
    if @role_user.save
      if params[:force].present?
        User.find(params[:role_user][:user_id]).role_ids = [params[:role_user][:role_id]]
      end
      redirect_to manage_roles_path, notice: 'Role added successfully'
    else
      render :index, alert: 'Error!'
    end
  end

  private

  def role_user_params
    params.require(:role_user).permit :user_id, :role_id, :force
  end
end
