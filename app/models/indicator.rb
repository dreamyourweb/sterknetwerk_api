class Indicator < ActiveRecord::Base
  attr_accessible :id, :aspect_id, :description, :example, :score, :title, :image_name, :pass_threshold
  has_many :questions
  belongs_to :aspect

  def pass(result=nil)
    return self.score(result) >= pass_threshold
  end

  def score(result=nil)

    score = 0
    nn = 0
    answers = result.answers
    questions.each do |question|
      nn = nn + 1
      if (result.answers.where(:question_id => question.id).first != nil)
        p result.answers.where(:question_id => question.id).first
        score = score + question.score(result.answers.where(:question_id => question.id).first)
      end
    end
    if nn > 0
      score = score / nn
    end
    return score
  end

end
