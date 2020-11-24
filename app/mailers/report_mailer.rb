class ReportMailer < ApplicationMailer
  def export_bookings(user_id, file_path)
    @recipient                  = User.find(user_id)
    @filename                   = File.basename(file_path)
    attachments[@filename.to_s] = File.read(file_path)

    mail to: @recipient.email, subject: 'Laporan Booking'
  end
end
