class Image < ActiveRecord::Base
  belongs_to :article
  has_attached_file :image, :path => (Rails.root + "files/:id").to_s,
                    :url => "/image/:id"
  
end
