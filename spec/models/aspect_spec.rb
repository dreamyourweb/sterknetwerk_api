require "spec_helper"

describe Aspect do
  describe ".cash" do
    before do
      @result = FactoryGirl.create(:result_kosten) #with questions about kosten
      #we need to associate te right kosten #hackaround!
      Question.all.each do |question|
        question.aspect = Aspect.where(title: "kosten").first
        question.save
      end
     # @aspect = FactoryGirl.create(:aspect_kosten) #with cash
    end
    
    it "should display cost total" do
      @aspect=Aspect.where(title: "kosten").first
      @aspect.get_client_cost(@result).should == 10*50000
    end

    it "should display cost sterknetwerk" do
      @aspect=Aspect.where(title: "kosten").first
      @aspect.get_sterknetwerk_cost(@result).should == 5*50000
    end

  end
  describe "score" do
    before do
      @result = FactoryGirl.create(:result)
    end
    it "should show score" do
      @aspect = Aspect.where(title: "beveiliging").first
      @aspect.score.should == 8
    end
  end
end