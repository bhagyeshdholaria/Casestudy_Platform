class WalkinController < ApplicationController
  skip_authorization_check
  def entry
    @user = User.new
  end

  def start
    results = UserCreator.new(reg_params).create_user
    if results.include?(:errors)
      redirect_to :entry, alert: results[:errors]
    else
      sign_in results[0]
      redirect_to casestudy_user_user_responses_path(results[1])
    end
  end

  private

  def reg_params
    params
  end
end
