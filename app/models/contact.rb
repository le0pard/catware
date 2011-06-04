class Contact
  include ActiveModel::Validations
  
  attr_accessor :name, :email, :subject, :message
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :message, :presence => true
  
  def to_model; self; end
  def persisted?; false; end
  def to_key; nil; end
  def to_param; nil; end
 
  def initialize(attributes = {})
    @attributes = attributes
  end
 
  def read_attribute_for_validation(key)
    @attributes[key]
  end
end