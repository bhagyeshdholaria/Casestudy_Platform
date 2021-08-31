class  AutocompletionJob < ApplicationJob
  queue_as :default

  def perform(casestudy_user)
    return unless casestudy_user.status == 'ongoing'

    casestudy_user.status = 'completed'
    casestudy_user.completed_time = DateTime.now
    casestudy_user.save!
  end
end
