class Indicator < ActiveRecord::Base
  attr_accessible :aspect_id, :description, :example, :score, :title, :image_name, :pass_threshold
  has_many :questions
  belongs_to :aspect

  def pass(results=nil)
    return self.score(results) >= 1#pass_threshold
  end

  def score(result=nil)
    score = 0
    nn = 0
    answers = result.answers
    p "BLA"
    questions.each do |question|
      nn = nn + 1
      p result.answers.find(:question_id => question.id).first
      score = score + question.score(result.answers.find(:question_id => question.id).first)
    end
    if nn > 0
      score = score / nn
    end
    return score
  end

end
