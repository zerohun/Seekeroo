

Given /^there are the following articles:$/ do |table|
  table.hashes.each do |attributes|
    
    image = Image.create!(:image => File.new(attributes[:file]))
    subtitle = Subtitle.create!(:text => attributes[:subtitle])

    @article = Article.create!(
      :id => attributes[:id],
      :image_id => image.id
    )
    @article.id = attributes[:id]
    @article.subtitles << subtitle
    @article.save


  end
end
