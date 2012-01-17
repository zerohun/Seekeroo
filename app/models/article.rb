class Article < ActiveRecord::Base
  belongs_to :user

  validate do |article|
    if article.image_id.blank?
      article.errors.add(:base, "You should upload at least one image file") 
    end
  end
  belongs_to :image

  has_many :tagboxes
  accepts_nested_attributes_for :tagboxes


end
