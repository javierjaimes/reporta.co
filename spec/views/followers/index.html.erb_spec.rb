require 'spec_helper'

describe "followers/index" do
  before(:each) do
    assign(:followers, [
      stub_model(Follower,
        :user => nil,
        :story => nil
      ),
      stub_model(Follower,
        :user => nil,
        :story => nil
      )
    ])
  end

  it "renders a list of followers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
