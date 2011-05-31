class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :password, :presence => { :on => :create }, :length => { :maximum => 100 }
end
