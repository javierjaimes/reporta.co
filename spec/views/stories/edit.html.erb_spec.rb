require 'spec_helper'

describe "stories/edit" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", story_path(@story), "post" do
      assert_select "textarea#story_body[name=?]", "story[body]"
      assert_select "input#story_user[name=?]", "story[user]"
    end
  end
end
