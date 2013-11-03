require 'spec_helper'

describe "stories/new" do
  before(:each) do
    assign(:story, stub_model(Story,
      :body => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stories_path, "post" do
      assert_select "textarea#story_body[name=?]", "story[body]"
      assert_select "input#story_user[name=?]", "story[user]"
    end
  end
end
