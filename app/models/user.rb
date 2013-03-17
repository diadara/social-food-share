class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :longitude, :lattitude

  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :leftovers
end
