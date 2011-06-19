class MediaAttachment < ActiveRecord::Base
  
  has_attached_file :media, 
                    :styles => { :medium => "220x365#",
                                 :thumb => "100x100#" }
  
end
