class Article < ActiveRecord::Base

  validates :image_id, :presence => true

  belongs_to :image
  has_many :subtitles

  accepts_nested_attributes_for :subtitles

end
