class Image < ActiveRecord::Base
  has_many :articles
  has_attached_file :image, :path => ("fingeroo/files/:id/:style/:filename").to_s,
                    :styles => {:pc => "640x480", :thumb => "100x100"},
                    :url => "/images/:id/:style",
                    :storage => :s3,
                    :bucket => 'zerohun_forupload',
                    :s3_credentials =>{
                      :access_key_id => 'AKIAJQ2VVHU4T7SLKKSQ',
                      :secret_access_key => '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'
#                      :path => "fingeroo/:id/:style/:filename"#,
#                      :url => "/images/:id"
                    
                   }
end
