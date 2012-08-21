require "spec_helper"

describe "/questions", type: :api do
  let(:user) { FactoryGirl.create(:user) } 
  let(:token) { user.authentication_token }
  
  before do
    @question = FactoryGirl.create(:question)
  end
  
  context "questions with user authentication" do
    let(:url) { "/questions" }
    it "json" do
      get "#{url}.json", token: token
      questions_json = Question.all.to_json
      last_response.body.should eql(questions_json)
      last_response.status.should eql(200)
      questions = JSON.parse(last_response.body)
      #p questions
      questions.any? do |q|
        q["title"] == "John"
      end.should be_true
    end
  end
end