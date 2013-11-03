require 'spec_helper'

describe "followers/edit" do
  before(:each) do
    @follower = assign(:follower, stub_model(Follower,
      :user => nil,
      :story => nil
    ))
  end

  it "renders the edit follower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", follower_path(@follower), "post" do
      assert_select "input#follower_user[name=?]", "follower[user]"
      assert_select "input#follower_story[name=?]", "follower[story]"
    end
  end
end
