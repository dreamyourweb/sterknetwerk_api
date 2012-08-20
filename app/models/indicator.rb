class Indicator < ActiveRecord::Base
  attr_accessible :aspect_id, :description, :example, :score, :title
  has_many :questions
  belongs_to :aspect
end
