require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:topic, Topic.new(
      :title => "MyString",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input#topic_title[name=?]", "topic[title]"

      assert_select "textarea#topic_body[name=?]", "topic[body]"

      assert_select "input#topic_user_id[name=?]", "topic[user_id]"
    end
  end
end
