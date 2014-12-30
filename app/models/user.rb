class User < ActiveRecord::Base
  has_many :pictures

  has_secure_password 
  validates :username, uniqueness: true
  validates :password, confirmation: true


end
