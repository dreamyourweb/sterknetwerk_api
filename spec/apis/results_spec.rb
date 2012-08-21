require "spec_helper"

describe "/results", type: :api do
  let(:user) { FactoryGirl.create(:user) } 
  let(:token) { user.authentication_token }
  
  before do
    #@question = FactoryGirl.create(:question)
    @results = FactoryGirl.create(:result)
  end
  
  context "questions with user authentication" do
    let(:url) { "/results/1" }
    it "json" do
      post "#{url}.json", token: token, results: results
      results_json = Result.first.to_json
      last_response.body.should eql(results_json)
      last_response.status.should eql(200)
      results = JSON.parse(last_response.body)
      #p questions
      results.any? do |q|
        q["email"] == "test"
      end.should be_true
    end
  end
end