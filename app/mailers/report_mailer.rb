class ReportMailer < ApplicationMailer
  def export_bookings(file_path)
    @filename = File.basename(file_path)
    attachments[@filename.to_s] = File.read(file_path)

    mail to: ENV['PRIORITY_ADMIN_EMAIL'], subject: 'Laporan Booking'
  end
end
