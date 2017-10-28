class Product < ApplicationRecord


  belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
  #belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"

  validates :name, :image, :term, :region, presence: true

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader


end
