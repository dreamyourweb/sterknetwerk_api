class Result < ActiveRecord::Base
  attr_accessible :bcc, :cc, :email, :company_name, :contact_name, :tel
  has_many :answers
end
