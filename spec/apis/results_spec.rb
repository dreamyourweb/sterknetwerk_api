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
    it "succesful JSON" do
      post "#{url}.json", token: token, results: {email: "test@email.com"}
      results = Result.where(email: "test@email.com").first
      route = "/results/#{results.id}"
      
      last_response.status.should eql(201)
      last_response.headers["Location"].should eql("http://example.org" + route)
      last_response.body.should eql(results.to_json)
    end
    
    it "unsuccessful JSON" do
      post "#{url}.json", :token => token,
                          :results => {}
      last_response.status.should eql(422)
      errors = {"errors" => {"email" => ["can't be blank", "is not an email"]}}.to_json
      last_response.body.should eql(errors)
    end
    it "succesful JSON questions" do
      post "#{url}.json", token: token, results: {email: "test@email.com", answers: [{question_id: 1, value: 8},{question_id: 2, value: 7}]}
      results = Result.where(email: "test@email.com").first
      results.answers.first.value.should eql(8)
      last_response.status.should eql(201)
    end
  end
end