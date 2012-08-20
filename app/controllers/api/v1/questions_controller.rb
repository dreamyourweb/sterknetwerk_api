class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    respond_with(Question.all)
  end
end