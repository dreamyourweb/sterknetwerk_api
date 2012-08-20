class Aspect < ActiveRecord::Base
  attr_accessible :score, :title, :answer_type
  has_many :questions
  has_many :indicators
end
