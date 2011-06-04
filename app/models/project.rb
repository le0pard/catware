class Project < ActiveRecord::Base
  
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
  
end
