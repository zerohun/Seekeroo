

Given /^there are the following articles:$/ do |table|
  table.hashes.each do |attributes|
    
    image = Image.create!(:image => File.new(attributes[:file]))
    tagbox = Tagbox.create!(:left => 0,
                            :top => 0,
                            :width => image.image.width("pc"),
                            :height => image.image.height("pc"))

    subtitle = Subtitle.create!(:text => attributes[:subtitle])

    @article = Article.create(
      :image_id => image.id
    )
    tagbox.subtitles << subtitle
    @article.tagboxes << tagbox
    @article.save!
  end
end
