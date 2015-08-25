class Post < ActiveRecord::Base
  belongs_to :user

  has_many :socialposts

  mount_uploader :image, PostImageUploader
end
