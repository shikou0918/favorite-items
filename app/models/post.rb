class Post < ApplicationRecord
  belongs_to :user, optional: true
  # has_many :comments
  mount_uploader :image, ImageUploader
  validates :name,  presence: true, length: { maximum: 40 }
  validates :content,       presence: true, length: { maximum: 300 }
  validates :image,         presence: true
end
