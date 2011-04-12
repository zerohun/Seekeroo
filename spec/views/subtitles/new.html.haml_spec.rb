require 'spec_helper'

describe "subtitles/new.html.haml" do
  before(:each) do
    assign(:subtitle, stub_model(Subtitle,
      :text => "MyString",
      :article_id => 1
    ).as_new_record)
  end

  it "renders new subtitle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subtitles_path, :method => "post" do
      assert_select "input#subtitle_text", :name => "subtitle[text]"
      assert_select "input#subtitle_article_id", :name => "subtitle[article_id]"
    end
  end
end
