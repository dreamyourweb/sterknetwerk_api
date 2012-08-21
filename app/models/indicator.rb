class Indicator < ActiveRecord::Base
  attr_accessible :aspect_id, :description, :example, :score, :title
  has_many :questions
  belongs_to :aspect

  def pass(results=nil)
  	if results == nil
  		return true
  	else
  		questions.each do |question|
  			# WIP
  			value = Answer.find(:question_id => question.id).value 
  		end
  	end
  end

end
