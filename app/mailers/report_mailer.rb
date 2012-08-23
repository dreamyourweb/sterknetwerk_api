class ReportMailer < ActionMailer::Base
  default from: "SterkNetwerk <info@sterknetwerk.nl>"

  def pdf_report(recipient_name, recipient_email, pdf_filename)
  	attachments['rapport.pdf'] = File.read(pdf_filename)
    mail(:to => "#{recipient_name} <#{recipient_email}>", :bcc => "SterkNetwerk <info@sterknetwerk.nl>") do |format|
    	format.text { render :text => "Bedankt voor het invullen van de Sterknetwerk vragenlijst.\nNeem gerust contact op bij vragen.\n\nMet vriendelijke groet,\nSterknetwerk" }
    end
  end
end
