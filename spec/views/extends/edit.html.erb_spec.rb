require 'spec_helper'

describe "extends/edit" do
  before(:each) do
    @extend = assign(:extend, stub_model(Extend,
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders the edit extend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", extend_path(@extend), "post" do
      assert_select "textarea#extend_body[name=?]", "extend[body]"
      assert_select "input#extend_user[name=?]", "extend[user]"
    end
  end
end
