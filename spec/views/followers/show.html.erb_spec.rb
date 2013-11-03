require 'spec_helper'

describe "followers/show" do
  before(:each) do
    @follower = assign(:follower, stub_model(Follower,
      :user => nil,
      :story => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
