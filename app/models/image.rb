class Image < ActiveRecord::Base
  belongs_to :article
  has_attached_file :image, :path => (Rails.root + "files/:id/:filename").to_s,
                    :url => "/image/:id"
  
end
