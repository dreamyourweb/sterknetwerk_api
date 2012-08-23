class Result < ActiveRecord::Base
  attr_accessible :bcc, :cc, :email, :company_name, :contact_name, :tel, :answers, :aspects
  has_many :answers
  validates :email, :presence => true, :email => true
  
  #def set_answers(array)
  def send_email
    pdf_filename = "tmp/report" + id.to_s + ".pdf"
    file = PDFKit.new(ResultsController.new.show_string(id)).to_file pdf_filename

    mail = ReportMailer.pdf_report(contact_name, email, pdf_filename)
    mail.deliver
  end
end