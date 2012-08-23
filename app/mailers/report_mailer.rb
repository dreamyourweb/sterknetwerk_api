class ReportMailer < ActionMailer::Base
  default from: "SterkNetwerk <info@sterknetwerk.nl>"

  def pdf_report(recipient_name, recipient_email, pdf_filename)
  	attachments['rapport.pdf'] = File.read(pdf_filename)
    mail(:to => "#{recipient_name} <#{recipient_email}>") do |format|
    	format.text { render :text => 'Render text' }
    end
         # :bcc => "SterkNetwerk <info@sterknetwerk.nl>")
  end
end
