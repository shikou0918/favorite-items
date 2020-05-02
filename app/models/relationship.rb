class Relationship < ApplicationRecord
  belongs_to :user
  # Followクラスという存在しないクラスを参照することを防ぎ、Userクラスであることを明示
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
