require 'spec_helper'

describe "subtitles/edit.html.haml" do
  before(:each) do
    @subtitle = assign(:subtitle, stub_model(Subtitle,
      :text => "MyString",
      :article_id => 1
    ))
  end

  it "renders the edit subtitle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subtitles_path(@subtitle), :method => "post" do
      assert_select "input#subtitle_text", :name => "subtitle[text]"
      assert_select "input#subtitle_article_id", :name => "subtitle[article_id]"
    end
  end
end
