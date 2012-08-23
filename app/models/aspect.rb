class Aspect < ActiveRecord::Base
  attr_accessible :score, :title, :answer_type
  has_many :questions
  has_many :indicators
  
  def get_sterknetwerk_cost(result=nil)
    if self.answer_type == 'cash'
      cash=0
      self.questions.each do |question|
        p question
        answer = result.answers.where(:question_id => question.id).first
        if (answer != nil && question.cash_sterknetwerk)
          cash = cash + question.factor * answer.value
        end
      end
      return cash
    else
      return 0
    end
  end
  
  def get_client_cost(result=nil)
    if self.answer_type == 'cash'
      cash=0
      p questions
      self.questions.each do |question|
        answer = result.answers.where(:question_id => question.id).first
        if (answer != nil)
          cash = cash + question.factor * answer.value
        end
      end
      return cash
    else
      return 0
    end
  end
end
