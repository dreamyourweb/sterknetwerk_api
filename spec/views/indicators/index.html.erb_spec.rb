require 'spec_helper'

describe "indicators/index" do
  before(:each) do
    assign(:indicators, [
      stub_model(Indicator,
        :title => "Title",
        :description => "Description",
        :example => "Example",
        :score => "Score",
        :aspect_id => 1
      ),
      stub_model(Indicator,
        :title => "Title",
        :description => "Description",
        :example => "Example",
        :score => "Score",
        :aspect_id => 1
      )
    ])
  end

  it "renders a list of indicators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Example".to_s, :count => 2
    assert_select "tr>td", :text => "Score".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
