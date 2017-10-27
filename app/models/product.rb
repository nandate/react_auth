class Product < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :borrower, class_name: "User"

  validates :seller_id, presence: true
  validates :name, presence: true
  
  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader
end
