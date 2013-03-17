class Leftover < ActiveRecord::Base
  attr_accessible :expires_at, :name, :serving_size, :user_id
  
  belongs_to :user
end
