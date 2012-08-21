class Answer < ActiveRecord::Base
  attr_accessible :question_id, :result_id, :value
  has_one :question
  belongs_to :result
end