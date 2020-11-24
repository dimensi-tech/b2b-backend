module Reports
  class ExportMailerService
    def initialize(user_id:, params:)
      @user_id = user_id
      @params  = params
    end

    def generate
      @app   = ActionDispatch::Integration::Session.new(Rails.application)
      params = @params.except(:type, :controller, :action).merge({ attachment: true })

      @app.get(bookings_path_name(@params[:locale], params))
      send_report
    end

    private

    def bookings_path_name(locale, params)
      "#{ENV['HOST_URL']}/#{locale}/bookings/report.xlsx?#{params.to_query}"
    end

    def send_report
      file_path = check_file

      return puts I18n.t('empty_messages.not_found') if file_path == I18n.t('empty_messages.not_found')

      ReportMailer.export_bookings(@user_id, file_path).deliver
    end

    def check_file
      counter   = 0
      file_path = ''

      until File.exist?(file_path)
        if counter == 720
          file_path = I18n.t('empty_messages.not_found')
          break
        end

        file_path = "#{Rails.root}/public/reports/" + I18n.t('bookings.report.page_header') + " - #{Date.today}.xlsx"

        counter += 1
      end

      file_path
    end
  end
end
