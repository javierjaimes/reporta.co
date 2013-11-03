require 'spec_helper'

describe "extends/show" do
  before(:each) do
    @extend = assign(:extend, stub_model(Extend,
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
