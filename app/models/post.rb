class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  mount_uploader :photo, PhotoUploader

  # Using law of demeter for loose coupling
  delegate :photo, :name, to: :user, prefix: true

  validates :photo, :description, :user_id, presence: true
  
  acts_as_votable
end