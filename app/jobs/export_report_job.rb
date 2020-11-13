class ExportReportJob < ApplicationJob
  queue_as 'b2b-backend-report'

  def perform(params)
    Reports::ExportMailerService.new(params: params).generate
  end
end
