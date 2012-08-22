class Indicator < ActiveRecord::Base
  attr_accessible :aspect_id, :description, :example, :score, :title, :image_name, :pass_threshold
  has_many :questions
  belongs_to :aspect

  def pass(results=nil)
    return self.score(results) >= 1#pass_threshold
  end

  def score(results=nil)
    score = 0
    nn = 0
    questions.each do |question|
      if question.value != -1
        nn = nn + 1
        score = score + question.value
      end
    end
    if nn > 0
      score = score / nn
    end
    return score
  end

  def image_name
    return "overalonline.png"
  end

end
