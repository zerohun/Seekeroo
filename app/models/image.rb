class Image < ActiveRecord::Base
  has_many :articles
  has_attached_file :image, :path => (Rails.root + "files/:id/:filename").to_s,
                    :url => "/image/:id"
  
end
