class ReportMailer < ActionMailer::Base
  default from: "info@sterknetwerk.nl"

  def pdf_report(recipient_email, pdf_filename, result_id)
  	attachments['rapport.pdf'] = File.read(pdf_filename)
    mail(:to => recipient_email,
         :bcc => ["info@sterknetwerk.nl"])
  end
end
