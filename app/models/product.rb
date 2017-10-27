class Product < ApplicationRecord


  #belongs_to :seller, class_name: "User"
  #belongs_to :borrower, class_name: "User"

  #validates :name, :image, :term, :region, :seller_id, presence: true

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  def set_borrower_id
    self.borrower_id = nil
  end

end
