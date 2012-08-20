class Question < ActiveRecord::Base
  attr_accessible :indicator_id, :aspect_id, :indicator, :aspect, :answer_scores, :answer_type, :answers, :factor, :score, :title
  belongs_to :aspect
  belongs_to :indicator
end
