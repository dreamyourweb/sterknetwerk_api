class Aspect < ActiveRecord::Base
  attr_accessible :id, :score, :title, :answer_type
  has_many :questions
  has_many :indicators
  
  def get_sterknetwerk_cost(result=nil)
    if self.answer_type == 'cash'
      cash=0
      self.questions.each do |question|
        #p question
        answer = result.answers.where(:question_id => question.id).first
        #p answer
        if (answer != nil && question.cash_sterknetwerk)
          cash = cash + question.factor * answer.value
          # p answer.value
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
          # p answer.value
        end
      end
      return cash
    else
      return 0
    end
  end

  def score(result=nil)
    score = 0
    if not result.nil?
      self.indicators.each do |indicator|
        score = score + indicator.score(result)
      end
      score = score/self.indicators.count
    end
    return score
  end

end
