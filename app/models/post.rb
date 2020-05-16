class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 40 }
  validates :content,       presence: true, length: { maximum: 300 }
  validates :image,         presence: true

  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
