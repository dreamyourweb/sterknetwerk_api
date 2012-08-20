class Question < ActiveRecord::Base
  attr_accessible :answer_scores, :answer_type, :answers, :factor, :indicator, :score, :title
end
