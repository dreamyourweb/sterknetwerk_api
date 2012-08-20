class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    respond_with(Question.all) #{questions: Question.all}.as_json)    
  end
end