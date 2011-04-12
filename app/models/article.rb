class Article < ActiveRecord::Base
  belongs_to :image

  has_many :subtitles

end
