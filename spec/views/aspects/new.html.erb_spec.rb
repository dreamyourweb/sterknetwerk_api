require 'spec_helper'

describe "aspects/new" do
  before(:each) do
    assign(:aspect, stub_model(Aspect,
      :title => "MyString",
      :score => 1
    ).as_new_record)
  end

  it "renders new aspect form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aspects_path, :method => "post" do
      assert_select "input#aspect_title", :name => "aspect[title]"
      assert_select "input#aspect_score", :name => "aspect[score]"
    end
  end
end
