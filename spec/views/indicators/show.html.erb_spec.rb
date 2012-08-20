require 'spec_helper'

describe "indicators/show" do
  before(:each) do
    @indicator = assign(:indicator, stub_model(Indicator,
      :title => "Title",
      :description => "Description",
      :example => "Example",
      :score => "Score",
      :aspect_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Example/)
    rendered.should match(/Score/)
    rendered.should match(/1/)
  end
end
