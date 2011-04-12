require 'spec_helper'

describe "subtitles/show.html.haml" do
  before(:each) do
    @subtitle = assign(:subtitle, stub_model(Subtitle,
      :text => "Text",
      :article_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
