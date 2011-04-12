require 'spec_helper'

describe "subtitles/index.html.haml" do
  before(:each) do
    assign(:subtitles, [
      stub_model(Subtitle,
        :text => "Text",
        :article_id => 1
      ),
      stub_model(Subtitle,
        :text => "Text",
        :article_id => 1
      )
    ])
  end

  it "renders a list of subtitles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
