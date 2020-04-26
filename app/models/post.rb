class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  mount_uploader :image, ImageUploader
  validates :name,  presence: true, length: { maximum: 40 }
  validates :content,       presence: true, length: { maximum: 300 }
  validates :image,         presence: true

  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
