require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user => nil,
      :topic => nil,
      :body => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_topic_id[name=?]", "comment[topic_id]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
