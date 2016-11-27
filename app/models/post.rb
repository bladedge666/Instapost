class Post < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "user_id" 
  has_many :comments
  validates :photo, :description, :user_id, presence: true
  # carrierwave boilerplate
  mount_uploader :photo, PhotoUploader

end
