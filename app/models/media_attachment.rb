class MediaAttachment < ActiveRecord::Base
  
  has_attached_file :media, 
                    :styles => { :medium => "220x365#",
                                 :medium_iphone => "220x332#",
                                 :thumb => "100x100#" }
  
end
