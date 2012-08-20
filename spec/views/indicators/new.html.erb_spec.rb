require 'spec_helper'

describe "indicators/new" do
  before(:each) do
    assign(:indicator, stub_model(Indicator,
      :title => "MyString",
      :description => "MyString",
      :example => "MyString",
      :score => "MyString",
      :aspect_id => 1
    ).as_new_record)
  end

  it "renders new indicator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => indicators_path, :method => "post" do
      assert_select "input#indicator_title", :name => "indicator[title]"
      assert_select "input#indicator_description", :name => "indicator[description]"
      assert_select "input#indicator_example", :name => "indicator[example]"
      assert_select "input#indicator_score", :name => "indicator[score]"
      assert_select "input#indicator_aspect_id", :name => "indicator[aspect_id]"
    end
  end
end
