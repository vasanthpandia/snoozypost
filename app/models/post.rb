class Post < ActiveRecord::Base
  belongs_to :user

  has_many :socialposts

  # mount_uploader :image, PostImageUploader

  accepts_nested_attributes_for :socialposts

  validates :content, presence: true
end
