class Post < ApplicationRecord
  # carrierwave boilerplate
  mount_uploader :photo, PhotoUploader

end
