require 'spec_helper'

describe ImagesController do
  let(:path) { Rails.root + "spec/fixtures/sarah.jpg"}
  let(:image) do
    Image.create(:image => File.open(path))
  end
  

  context "no user" do
      it "delete images record with real image file" do
        filepath = image.image.path
        image.destroy
        begin
        File.open(filepath)
        rescue Exception => e
           e.to_s.should eql("No such file or directory - #{filepath}")
        end
      end
  end

end


