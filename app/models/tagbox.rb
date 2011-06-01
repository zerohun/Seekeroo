class Tagbox < ActiveRecord::Base
  belongs_to :article

  has_many :subtitles
  accepts_nested_attributes_for :subtitles

end
