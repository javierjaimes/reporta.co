require 'spec_helper'

describe "followers/new" do
  before(:each) do
    assign(:follower, stub_model(Follower,
      :user => nil,
      :story => nil
    ).as_new_record)
  end

  it "renders new follower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", followers_path, "post" do
      assert_select "input#follower_user[name=?]", "follower[user]"
      assert_select "input#follower_story[name=?]", "follower[story]"
    end
  end
end
