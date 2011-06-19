class MediaVideo < ActiveRecord::Base
  
  has_attached_file :logo, 
                    :styles => { :thumb => "155x87#" }
  
  module MEDIA_TYPES
    YOUTUBE   = 0
    VIMEO     = 1
    HUMAN     = ["youtube", "vimeo"]
  end
  
  def is_youtube?
    MEDIA_TYPES::YOUTUBE == self.type_id
  end
  
  def is_vimeo?
    MEDIA_TYPES::VIMEO == self.type_id
  end
  
  def human_type
    MEDIA_TYPES::HUMAN[self.type_id]
  end
  
  def self.selected_media_types
    selector = []
    MEDIA_TYPES::HUMAN.each_index do |key|
      selector << [MEDIA_TYPES::HUMAN[key], key]
    end
    selector
  end
  
  def video_url
    video_link = case self.type_id
    when MEDIA_TYPES::YOUTUBE
      "http://www.youtube.com/watch?v=#{self.video_key}"
    when MEDIA_TYPES::VIMEO
      "http://vimeo.com/#{self.video_key}"
    end
    video_link
  end
  
end
