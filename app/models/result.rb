class Result < ActiveRecord::Base
  attr_accessible :bcc, :cc, :email, :company_name, :contact_name, :tel, :answers
  has_many :answers
  validates :email, :presence => true, :email => true
  
  #def set_answers(array)
end