require "spec_helper"

describe "/results", type: :api do
  let(:user) { FactoryGirl.create(:user) } 
  let(:token) { user.authentication_token }
  
  before do
    #@question = FactoryGirl.create(:question)
    @results = FactoryGirl.attributes_for(:result)
  end
  
  context "results with user authentication" do
    let(:url) { "/results" }
    it "json" do
      post "#{url}.json", token: token, results: @results
      results_json = Result.first.to_json
      last_response.body.should eql(results_json)
      last_response.status.should eql(201)
      results = JSON.parse(last_response.body)
      #p questions
      results.any? do |q|
        q["email"] == "test"
      end.should be_true
    end
  end
end