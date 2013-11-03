require 'spec_helper'

describe "extends/new" do
  before(:each) do
    assign(:extend, stub_model(Extend,
      :body => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new extend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", extends_path, "post" do
      assert_select "textarea#extend_body[name=?]", "extend[body]"
      assert_select "input#extend_user[name=?]", "extend[user]"
    end
  end
end
