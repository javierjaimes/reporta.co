require 'spec_helper'

describe "extends/index" do
  before(:each) do
    assign(:extends, [
      stub_model(Extend,
        :body => "MyText",
        :user => nil
      ),
      stub_model(Extend,
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of extends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
