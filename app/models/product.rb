class Product < ApplicationRecord
  belongs_to :user
  belongs_to :lent_user, class_name: "User"

  validates :user_id, presence: true
  validates :name
  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader
end
