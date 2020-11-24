class ExportReportJob < ApplicationJob
  queue_as 'b2b-backend-report'

  def perform(user_id, params)
    Reports::ExportMailerService.new(user_id: user_id, params: params).generate
  end
end
