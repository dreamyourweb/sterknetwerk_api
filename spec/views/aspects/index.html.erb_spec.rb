require 'spec_helper'

describe "aspects/index" do
  before(:each) do
    assign(:aspects, [
      stub_model(Aspect,
        :title => "Title",
        :score => 1
      ),
      stub_model(Aspect,
        :title => "Title",
        :score => 1
      )
    ])
  end

  it "renders a list of aspects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
