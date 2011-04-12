class Image < ActiveRecord::Base
  has_many :articles
  has_attached_file :image, :path => (Rails.root + "files/:id/:style/:filename").to_s,
                    :styles => {:pc => "640x480", :thumb => "100x100"},
                    :url => "/images/:id"
  
end
