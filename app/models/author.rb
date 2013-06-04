class Author < ActiveRecord::Base
  attr_accessible :address, :email, :firstName, :lastName, :phone, :profile
  validates :firstName, :lastName, :presence => true

  has_many :designs
end
