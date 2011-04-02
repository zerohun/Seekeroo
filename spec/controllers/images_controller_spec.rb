require 'spec_helper'

describe ImagesController do
  let(:path) { Rails.root + "spec/fixtures/sarah.jpg"}
  let(:image) do
    Image.create(:image => File.open(path))
  end

  context "no user" do
      it "delete images record with real image file" do
        
      end
  end


end
