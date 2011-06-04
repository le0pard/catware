class Project < ActiveRecord::Base
  
  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 255 }
  validates :short_description, :presence => true
  
  has_friendly_id :title, :use_slug => true
  
  has_attached_file :logo_img, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }
  
  module TYPE
    WEB = 0
    MOBILE = 1
    NAMES = [:web, :mobile]
    HUMAN = ["web", "mobile"]
  end
  
  def type_human
    TYPE::HUMAN[self.type_id].capitalize
  end
  
  def is_web?
    TYPE::WEB == self.type_id
  end
  
  def is_mobile?
    TYPE::MOBILE == self.type_id
  end
  
  def short_description_markdown
    markdown = RDiscount.new(self.short_description)
    return markdown.to_html
  end
  
  def full_description_markdown
    markdown = RDiscount.new(self.full_description)
    return markdown.to_html
  end
end
