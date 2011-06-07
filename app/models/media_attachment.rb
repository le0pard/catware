class MediaAttachment < ActiveRecord::Base
  
  has_attached_file :media, 
                    :styles => { :medium => "400x400>",
                                 :thumb => "100x100#" }
  
end
