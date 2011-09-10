class User < ActiveRecord::Base
  attr_accessible :email
  has_many :groups,:through=>:user_groups
  has_many :user_groups
end
