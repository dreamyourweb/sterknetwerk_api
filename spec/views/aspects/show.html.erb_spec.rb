require 'spec_helper'

describe "aspects/show" do
  before(:each) do
    @aspect = assign(:aspect, stub_model(Aspect,
      :title => "Title",
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
  end
end
