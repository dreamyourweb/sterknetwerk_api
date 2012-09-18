class Question < ActiveRecord::Base
  attr_accessible :id, :indicator_id, :aspect_id, :indicator, :aspect, :answer_scores, :answer_type, :answers, :factor, :score, :title, :cash_sterknetwerk
  belongs_to :aspect
  belongs_to :indicator

  def score(answer=nil)
  	if answer && answer.value != -1
      if not answer_scores[answer.value].nil?
  		  return answer_scores[answer.value]
      else
        return 0
      end
  	else
  		return 0
  	end
  end

end
